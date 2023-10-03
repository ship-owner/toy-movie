package com.toy.movie.service;

import com.toy.movie.dto.TokenInfoDto;
import com.toy.movie.dto.UserDto;
import com.toy.movie.entity.User;
import com.toy.movie.repository.UserRepository;
import com.toy.movie.util.JwtTokenProvider;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * packageName    : com.toy.movie.service
 * fileName       : UserService
 * author         : shipowner
 * date           : 2023-09-16
 * description    :
 */

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder bCryptPasswordEncoder;

    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final JwtTokenProvider jwtTokenProvider;


    /**
     * methodName : save
     * author : shipowner
     * description : 사용자 정보 저장
     *
     */
    @Transactional
    public Long save(UserDto userDto) {
        return userRepository.save(User.builder()
                .email(userDto.getEmail())
                .name(userDto.getName())
                .password(bCryptPasswordEncoder.encode(userDto.getPassword()))
                .build()).getId();
    }

    /**
     * methodName : login
     * author : shipowner
     * description : 로그인 정보 검증하여 토큰 반환
     *
     */
    public TokenInfoDto login(UserDto userDto) throws Exception{
        // 1. Login ID/PW 를 기반으로 Authentication 객체 생성
        // 이때 authentication 는 인증 여부를 확인하는 authenticated 값이 false
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDto.getEmail(), userDto.getPassword());

        // 2. 실제 검증 (사용자 비밀번호 체크)이 이루어지는 부분
        // authenticate 매서드가 실행될 때 CustomUserDetailsService 에서 만든 loadUserByUsername 메서드가 실행
        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);

        // 3. 인증 정보를 기반으로 JWT 토큰 생성
        TokenInfoDto tokenInfo = jwtTokenProvider.generateToken((User)authentication.getPrincipal());

        return tokenInfo;
    }

}