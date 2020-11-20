package org.project.notablog.controllers;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.project.notablog.repos.MessageRepo;
import org.project.notablog.service.MessageService;
import org.project.notablog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserService userService;

    @Autowired
    MessageService messageService;

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "userProfile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String email,
            @RequestParam String password
    )
    {
        userService.updateProfile(user, email, password);

        return "redirect:/user/profile";
    }

    @GetMapping("{user}")
    public String userPage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            Model model,
            @RequestParam(required = false) Message message
    )
    {
        Set<Message> messages = user.getMessages();

        model.addAttribute("author", user);
        model.addAttribute("SubscriptionsCount", user.getSubscriptions().size());
        model.addAttribute("SubscribersCount", user.getSubscribers().size());
        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
        model.addAttribute("messages", messages);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(user));


        return "userPage";
    }

    @PostMapping("{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("postTitle") String postTitle,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file")MultipartFile file
            ) throws IOException {
        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text)) {
                message.setText(text);
            }
            if (!StringUtils.isEmpty(tag)) {
                message.setTag(tag);
            }
            if (!StringUtils.isEmpty(postTitle)) {
                message.setPostTitle(postTitle);
            }

            messageService.saveFile(message, file);

            messageRepo.save(message);
        }
        return "redirect:/user/" + user;
    }

    @GetMapping("{user}/subscribe")
    public String subscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user
    ) {
        userService.subscribe(currentUser, user);

        return "redirect:/user/" + user.getId();
    }

    @GetMapping("{user}/unsubscribe")
    public String unsubscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user
    ) {
        userService.unsubscribe(currentUser, user);

        return "redirect:/user/" + user.getId();
    }

    @GetMapping("{type}/{user}/list")
    public String userList(
            Model model,
            @PathVariable User user,
            @PathVariable String type
    ) {
        model.addAttribute("userChannel", user);
        model.addAttribute("type", type);

        if ("subscriptions".equals(type)) {
            model.addAttribute("users", user.getSubscriptions());
        } else {
            model.addAttribute("users", user.getSubscribers());
        }

        return "subscriptions";
    }

}
