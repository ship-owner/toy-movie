package com.toy.movie.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * packageName    : com.toy.movie.dto
 * fileName       : TokenInfoDto
 * author         : shipowner
 * date           : 2023-09-18
 * description    : JWT 토큰 정보 저장 DTO
 */

@Builder
@Data
@AllArgsConstructor
public class TokenInfoDto {

    private String grantType;
    private String accessToken;
    private String refreshToken;
}

