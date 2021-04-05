package org.project.notablog.controllers;

import org.project.notablog.domains.Message;
import org.project.notablog.domains.User;
import org.project.notablog.domains.dto.MessageDto;
import org.project.notablog.repos.MessageRepo;
import org.project.notablog.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class FeedController {
    @Autowired
    MessageService messageService;

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/feed")
    public String feed(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = {"date"}, direction = Sort.Direction.DESC) Pageable pageable,
            @AuthenticationPrincipal User user
    ) {
        Page<MessageDto> page = messageService.userFeed(filter, pageable, user);


        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "feed";
    }

    @GetMapping("/")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = {"date"}, direction = Sort.Direction.DESC) Pageable pageable,
            @AuthenticationPrincipal User user
            ) {
        Page<MessageDto> page = messageService.messageList(filter, pageable, user);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/")
    public String add(
                @AuthenticationPrincipal User user,
                @Valid Message message,
                BindingResult bindingResult,
                Model model,
                @RequestParam("file") MultipartFile file
    ) throws IOException {
        Date date = new Date();
        message.setAuthor(user);

        //TODO Разобрать еще раз
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);

            Iterable<Message> messages = messageRepo.findAll();

            model.addAttribute("messages", messages);
            return "/";

        } else {
            message.setDate(date);

            messageService.saveFile(message, file);

            messageRepo.save(message);

            Iterable<Message> messages = messageRepo.findAll();

            model.addAttribute("messages", messages);
            return "redirect:/";
        }

    }



}
