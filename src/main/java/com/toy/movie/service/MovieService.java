package com.toy.movie.service;

import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.MovieSearchDto;
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

    /**
     * methodName : getMovieTrends
     * author : shipowner
     * description : 최신 트렌드 영화 목록 조회
     *
     */
    public List<MovieDto> getMovieTrends(){
        return tmdbApiModule.getMovieTrends();
    }

    /**
     * methodName : getProviders
     * author : shipowner
     * description : 영화 제공 OTT 목록 조회
     *
     */
    public List<ProviderDto> getProviders(){
        return tmdbApiModule.getProviders();
    }

    /**
     * methodName : getProviders
     * author : shipowner
     * description : 검색 필터에 따른 영화 목록 조회
     *
     */
    public List<MovieDto> findMovieList(MovieSearchDto movieSearchDto){
        return tmdbApiModule.findMovieList(movieSearchDto);
    }

    /**
     * methodName : findDetailByMovieId
     * author : shipowner
     * description : 영화 상세 정보 조회
     *
     */
    public MovieDto findDetailByMovieId(Integer movieId){
        MovieDto movieDto = tmdbApiModule.findDetailByMovieId(movieId);

        movieDto.setActorList(tmdbApiModule.findAcotrsByMovieId(movieId));
        tmdbApiModule.findProviderByMovieId(movieDto);

        return movieDto;
    }

}
