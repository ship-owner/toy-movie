package com.toy.movie.service;

import com.toy.movie.dto.TokenInfoDto;
import com.toy.movie.entity.RefreshToken;
import com.toy.movie.entity.User;
import com.toy.movie.repository.RefreshTokenRepository;
import com.toy.movie.repository.UserRepository;
import com.toy.movie.util.CookieUtil;
import com.toy.movie.util.JwtTokenProvider;
import com.toy.movie.util.RequestUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.net.URLEncoder;
import java.util.Optional;

/**
 * packageName    : com.toy.movie.core.service
 * fileName       : JwtTokenService
 * author         : shipowner
 * date           : 2023-09-26
 */


@Service
@RequiredArgsConstructor
public class JwtTokenService {

    private final RefreshTokenRepository refreshTokenRepository;
    private final UserRepository userRepository;

    private final JwtTokenProvider jwtTokenProvider;

    /**
     * methodName : registerToken
     * author : shipowner
     * description : 토큰 쿠키 등록 및 DB 저장
     *
     */
    @Transactional
    public void registerToken(HttpServletResponse response, HttpServletRequest request, TokenInfoDto tokenInfoDto){
        String accessToken = URLEncoder.encode(tokenInfoDto.getGrantType() + " " + tokenInfoDto.getAccessToken());

        CookieUtil.setCookies("refreshToken",tokenInfoDto.getRefreshToken(),24 * 60 * 60, true, response);
        CookieUtil.setCookies("Authorization",accessToken,24 * 60 * 60,true, response);

        Authentication authentication = jwtTokenProvider.getAuthentication(tokenInfoDto.getAccessToken());
        User user = (User) authentication.getPrincipal();

        refreshTokenRepository.save(RefreshToken.builder()
                .userId(user.getId())
                .ip(RequestUtil.getClientIp(request))
                .refreshToken(tokenInfoDto.getRefreshToken())
                .build());
    }

    /**
     * methodName : removeToken
     * author : shipowner
     * description : 토큰 쿠키 및 DB에서 삭제
     *
     */
    @Transactional
    public void removeToken(HttpServletResponse response, HttpServletRequest request){
        String refreshToken = CookieUtil.getCookieVal("refreshToken", request);

        CookieUtil.removeCookie("refreshToken",response);
        CookieUtil.removeCookie("Authorization",response);

        refreshTokenRepository.deleteByRefreshToken(refreshToken);
    }

    /**
     * methodName : reissueToken
     * author : shipowner
     * description : 검증 만료된 Access Token을 Refresh Token으로 재발급
     *
     */
    @Transactional
    public String reissueToken(HttpServletRequest request) {

        String accessToken = null;

        String refreshTokenStr = CookieUtil.getCookieVal("refreshToken",request);

        //2. validateToken 메서드로 토큰 유효성 검사
        if (refreshTokenStr != null && jwtTokenProvider.validateToken(refreshTokenStr)) {
            //3. 저장된 refresh token 찾기
            Optional<RefreshToken> refreshTokenOpt = refreshTokenRepository.findByRefreshToken(refreshTokenStr);

            if(refreshTokenOpt.isPresent()) {
                RefreshToken refreshToken = refreshTokenOpt.get();

                if (refreshToken != null) {
                    //4. 최초 로그인한 ip 와 같은지 확인 (처리 방식에 따라 재발급을 하지 않거나 메일 등의 알림을 주는 방법이 있음)
                    if (RequestUtil.getClientIp(request).equals(refreshToken.getIp())) {

                        // 5. Redis 에 저장된 RefreshToken 정보를 기반으로 JWT Token 생성
                        Optional<User> userOptional = userRepository.findById(refreshToken.getUserId());

                        if (userOptional.isPresent()) {
                            User user = userOptional.get();
                            accessToken = jwtTokenProvider.generateAccessToken(user);
                        }
                    }
                }
            }
        }

        return accessToken;
    }
}
