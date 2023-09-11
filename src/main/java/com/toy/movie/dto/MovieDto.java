package com.toy.movie.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
//@JsonIgnoreProperties(ignoreUnknown = true)
public class MovieDto {

    private Integer id;
    private String title;
    private Boolean video;
    private Boolean adult;
    private String posterPath;
    private String backdropPath;
    private String overview;
    private BigDecimal voteAverage;
    private Integer voteCount;
    private BigDecimal popularity;
    private String releaseDate;

}
