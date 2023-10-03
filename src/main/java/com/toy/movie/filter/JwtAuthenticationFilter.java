package com.toy.movie.filter;

import com.toy.movie.service.JwtTokenService;
import com.toy.movie.util.JwtTokenProvider;
import com.toy.movie.util.CookieUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * packageName    : com.toy.movie.filter
 * fileName       : JwtAuthenticationFilter
 * author         : shipowner
 * date           : 2023-09-18
 * description    : JWT 토큰 검증 필터
 */

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtTokenProvider jwtTokenProvider;
    private final JwtTokenService jwtTokenService;


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // 1. Cookie 에서 JWT 토큰 추출
        String accessToken = CookieUtil.getCookieVal("Authorization", request);

        if (StringUtils.hasText(accessToken) && accessToken.startsWith("Bearer")) {
            accessToken =  accessToken.substring(7);
        }

        // 2. validateToken 으로 토큰 유효성 검사
        if (StringUtils.hasText(accessToken)) {
            if(jwtTokenProvider.validateToken(accessToken)) {
                // 토큰이 유효할 경우 토큰에서 Authentication 객체를 가지고 와서 SecurityContext 에 저장
                Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
                SecurityContextHolder.getContext().setAuthentication(authentication);
            } else {
                accessToken = jwtTokenService.reissueToken(request);
                if(accessToken != null) {
                    Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                    CookieUtil.setCookies("Authorization",URLEncoder.encode("Bearer " + accessToken),24 * 60 * 60,true, response);
                }
            }
        }
        filterChain.doFilter(request, response);
    }



}