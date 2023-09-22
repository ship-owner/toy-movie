package com.toy.movie.repository;

import com.toy.movie.dto.UserDto;

/**
 * packageName    : com.toy.movie.repository
 * fileName       : UserRepositoryCustom
 * author         : shipowner
 * date           : 2023-09-21
 * description    : User 엔티티를 관리하기 위한 Custom Repository
 */
public interface UserRepositoryCustom {

    UserDto findUserDtoByEmail(String email);
}
