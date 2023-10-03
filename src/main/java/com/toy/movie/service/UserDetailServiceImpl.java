package com.toy.movie.service;

import com.toy.movie.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

/**
 * packageName    : com.toy.movie.service
 * fileName       : UserDetailService
 * author         : shipowner
 * date           : 2023-09-15
 * description    :
 */

@Service
@RequiredArgsConstructor
public class UserDetailServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    /**
     * methodName : loadUserByUsername
     * author : shipowner
     * description : 이메일로 사용자 정보 조회
     *
     */
    @Override
    public UserDetails loadUserByUsername(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException(email));
    }
}
