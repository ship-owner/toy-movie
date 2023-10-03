package com.toy.movie.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * packageName    : com.toy.movie.controller
 * fileName       : CustomErrorController
 * author         : shipowner
 * date           : 2023-10-01
 */

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping(value = "/error")
    public String errorPage() {
        return "error";
    }

}
