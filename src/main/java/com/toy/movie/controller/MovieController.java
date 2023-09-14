package com.toy.movie.controller;

import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.ProviderDto;
import com.toy.movie.service.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * packageName    : com.toy.movie.controller
 * fileName       : MovieController.java
 * author         : shipowner
 * date           : 2023-09-11
 */
@Controller
@RequestMapping(value = "/movie")
@RequiredArgsConstructor
public class MovieController {

    private final MovieService movieService;

    @RequestMapping(value = "/index")
    public String homePage() {
        return "/movie/index";
    }

    @RequestMapping(value = "/detail/{movieId}")
    public ModelAndView detail(@PathVariable(value = "movieId") Integer movieId) {
        ModelAndView mv = new ModelAndView("/movie/detail");
        mv.addObject("movie",movieService.findMovieByMovieId(movieId));
        return mv;
    }

    @RequestMapping(value = "/trends", method = RequestMethod.GET)
    public @ResponseBody List<MovieDto> getMovieTrends(){
        return movieService.getMovieTrends();
    }

    @RequestMapping(value = "/providers", method = RequestMethod.GET)
    public @ResponseBody List<ProviderDto> getMovieProviders(){
        return movieService.getMovieProviders();
    }

}
