package com.toy.movie.service;

import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.ProviderDto;
import com.toy.movie.external.TmdbApiModule;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.toy.movie.core.service
 * fileName       : MovieService
 * author         : shipowner
 * date           : 2023-09-12
 */

@Service
@RequiredArgsConstructor
public class MovieService {

    private final TmdbApiModule tmdbApiModule;

    public List<MovieDto> getMovieTrends(){
        return tmdbApiModule.getMovieTrends();
    }

    public List<ProviderDto> getMovieProviders(){
        return tmdbApiModule.getMovieProviders();
    }

    public MovieDto findMovieByMovieId(Integer movieId){
        MovieDto movieDto = tmdbApiModule.findMovieDetailByMovieId(movieId);
        return movieDto;
    }

}
