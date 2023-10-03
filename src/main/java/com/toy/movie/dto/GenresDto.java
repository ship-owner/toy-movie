package com.toy.movie.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * packageName    : com.toy.movie.dto
 * fileName       : GenresDto
 * author         : shipowner
 * date           : 2023-09-11
 * description    : 영화 장르
 */

@Getter
@Setter
@NoArgsConstructor
public class GenresDto {

    private Integer id;
    private String name;

}
