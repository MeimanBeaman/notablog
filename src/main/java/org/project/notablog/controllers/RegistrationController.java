package org.project.notablog.controllers;

import org.project.notablog.domains.User;
import org.project.notablog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam String passwordConfirm,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {
        boolean isPasswordConfirmEmpty =
                StringUtils.isEmpty(passwordConfirm);

        if (isPasswordConfirmEmpty) {
            model.addAttribute("passwordConfirmError", "Password confirmation cannot be empty");

        }

        if (user.getPassword() != null &&
                !user.getPassword()
                        .equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Passwords are different");

            return "registration";
        }

        if (isPasswordConfirmEmpty ||
                bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.addAttribute("map", errors);

            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "Username or email already taken");
            return "registration";
        }


        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate (Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Account successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found");
        }

        return "login";
    }
}
