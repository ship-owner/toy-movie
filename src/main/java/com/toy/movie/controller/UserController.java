package com.toy.movie.controller;

import com.toy.movie.dto.TokenInfoDto;
import com.toy.movie.dto.UserDto;
import com.toy.movie.service.JwtTokenService;
import com.toy.movie.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.security.Principal;

/**
 * packageName    : com.toy.movie.controller
 * fileName       : UserController
 * author         : shipowner
 * date           : 2023-09-15
 * description    :
 */

@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final JwtTokenService jwtTokenService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/user/login";
    }

    @ResponseBody
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public ResponseEntity signup(UserDto userDto) {

        try {
            userService.save(userDto);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }

        return ResponseEntity.ok().build();
    }

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity login(HttpServletRequest request
            , HttpServletResponse response
            , UserDto userDto) {

        try {
            TokenInfoDto tokenInfoDto = userService.login(userDto);
            jwtTokenService.registerToken(response, request, tokenInfoDto);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }


        return ResponseEntity.ok().build();
    }

    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ResponseEntity logout(HttpServletRequest request
            , HttpServletResponse response) {

        try {
            jwtTokenService.removeToken(response, request);

        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }

        return ResponseEntity.ok().build();
    }

}
