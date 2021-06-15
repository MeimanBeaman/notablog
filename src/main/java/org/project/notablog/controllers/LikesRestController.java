package org.project.notablog.controllers;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

@RestController
public class LikesRestController {

    @GetMapping("like/{post}")
    public Integer like(@PathVariable Message post) {
        return post.getLikes().size();
    }


}
