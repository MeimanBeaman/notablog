package org.project.notablog.controllers;

import com.google.common.collect.Iterables;
import org.project.notablog.domains.Message;
import org.project.notablog.domains.MessageComment;
import org.project.notablog.domains.User;
import org.project.notablog.repos.MessageRepo;
import org.project.notablog.repos.CommentsRepo;
import org.project.notablog.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.util.Date;
import java.util.Set;

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
        Iterable<MessageComment> comments = commentsRepo.findByMessage(message);

        int commentsSize = Iterables.size(comments);
        boolean hasComments;
        if (commentsSize > 0) {
            hasComments = true;
        } else {
            hasComments = false;
        }

        model.addAttribute("message", message);
        model.addAttribute("hasComments", hasComments);
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

        MessageComment messageComment = new MessageComment(message, user, text, date);
        commentsRepo.save(messageComment);

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        return "redirect:/post/" + postId.toString();
    }

    @GetMapping("comment/delete/{comment}")
    public String deleteComment(
            @AuthenticationPrincipal User user,
            @PathVariable MessageComment comment,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        if (comment.getUser().equals(user)) {
            commentsRepo.deleteById(comment.getId());
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

    @GetMapping("/{post}/like")
    public String like(
            @AuthenticationPrincipal User user,
            @PathVariable Message post,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = post.getLikes();

        if (likes.contains(user)) {
            likes.remove(user);
        } else {
            likes.add(user);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

    @Transactional
    @GetMapping("delete/{post}")
    public String deletePost(
            @AuthenticationPrincipal User user,
            @PathVariable Message post,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        if (post.getAuthor().equals(user)) {

            commentsRepo.deleteByMessage(post);
            if (commentsRepo.findByMessage(post).isEmpty()) {
                messageRepo.deleteMessageById(post.getId());
            }
            if (!(post.getFilename() == null)) {
                messageService.deleteFile(post.getFilename());
            }
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

    @GetMapping("/edit/{post}")
    public String messageEdit(
            @PathVariable Long post,
            Model model
    ) {
        Message message = messageRepo.findById(post).get();
        model.addAttribute("message", message);

        return "postEdit";
    }

    @PostMapping("edit/{post}")
    public String messageUpdate(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long post,
            @RequestParam("id") Message message,
            @RequestParam("postTitle") String postTitle,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
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
        return "redirect:/post/edit/" + post;
    }
}
