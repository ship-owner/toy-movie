package com.toy.movie.controller;

import com.toy.movie.dto.CommentDto;
import com.toy.movie.entity.User;
import com.toy.movie.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * packageName    : com.toy.movie.controller
 * fileName       : CommentController
 * author         : shipowner
 * date           : 2023-10-01
 */

@Controller
@RequestMapping(value = "/comment")
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity saveComment(CommentDto commentDto
            , Authentication authentication){

        User user = (User)authentication.getPrincipal();
        commentService.save(commentDto, user.getId());

        return ResponseEntity.ok().build();
    }

    @RequestMapping(value = "/{movieId}", method = RequestMethod.GET)
    public ModelAndView getComments(@PathVariable(value = "movieId") Integer movieId){

        ModelAndView mv = new ModelAndView("/movie/comment");
        mv.addObject("comments",commentService.findCommentByMovieId(movieId));
        return mv;
    }

}
