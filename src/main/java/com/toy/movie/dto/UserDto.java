package com.toy.movie.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.toy.movie.dto
 * fileName       : UserDto
 * author         : shipowner
 * date           : 2023-09-16
 * description    : 사용자 로그인 정보
 */

@Data
@NoArgsConstructor
public class UserDto {

    private String name;
    private String email;
    private String password;
}
