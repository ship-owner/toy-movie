package com.toy.movie.controller;

import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.MovieSearchDto;
import com.toy.movie.dto.ProviderDto;
import com.toy.movie.service.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


/**
 * packageName    : com.toy.movie.controller
 * fileName       : MovieController
 * author         : shipowner
 * date           : 2023-09-11
 */

@Controller
@RequestMapping(value = "/movie")
@RequiredArgsConstructor
public class MovieController {

    private final MovieService movieService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/movie/index";
    }

    @RequestMapping(value = "/detail/{movieId}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable(value = "movieId") Integer movieId) {
        ModelAndView mv = new ModelAndView("/movie/detail");
        mv.addObject("movie",movieService.findDetailByMovieId(movieId));
        return mv;
    }

    @RequestMapping(value = "/trend", method = RequestMethod.GET)
    public @ResponseBody List<MovieDto> getMovieTrends(){
        return movieService.getMovieTrends();
    }

    @RequestMapping(value = "/latest", method = RequestMethod.GET)
    public @ResponseBody List<MovieDto> getLatestMovies()
    {
        Date now = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MONTH, -1);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        MovieSearchDto movieSearchDto = new MovieSearchDto();
        movieSearchDto.setRegion("KR");
        movieSearchDto.setSortBy("popularity.desc");
        movieSearchDto.setReleaseDateLte(sdf.format(now));
        movieSearchDto.setReleaseDateGte(sdf.format(calendar.getTime()));
        return movieService.findMovieList(movieSearchDto);
    }

    @RequestMapping(value = "/providers", method = RequestMethod.GET)
    public @ResponseBody List<ProviderDto> getProviders(){
        return movieService.getProviders();
    }

}
