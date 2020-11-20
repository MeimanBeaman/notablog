package org.project.notablog.controllers;

import com.sun.xml.bind.v2.TODO;
import org.project.notablog.domains.Message;
import org.project.notablog.domains.MessageComment;
import org.project.notablog.domains.User;
import org.project.notablog.repos.MessageRepo;
import org.project.notablog.repos.CommentsRepo;
import org.project.notablog.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@RequestMapping("post")
@Controller
public class PostController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private CommentsRepo commentsRepo;

    @Autowired
    MessageService messageService;

    //TODO переделать
    @GetMapping("{postId}")
    public String post(@PathVariable Long postId,
                       Model model){
        Message message = messageRepo.findById(postId).get();
        Message messageToModel = message;
        Iterable<MessageComment> comments = commentsRepo.findByMessage(message);

        model.addAttribute("message", message);
        model.addAttribute("comments", comments);

        return "post";
    }

    @PostMapping("{postId}")
    public String addComment(
            @PathVariable Long postId,
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            Model model) {
        Date date = new Date();
        Message message = messageRepo.findById(postId).get();

        //TODO перенести в MessageService
        text = text.replace("\n", "<br>");

        MessageComment messageComment = new MessageComment(message, user, text, date);
        commentsRepo.save(messageComment);

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        return "redirect:/post/" + postId.toString();
    }

}
