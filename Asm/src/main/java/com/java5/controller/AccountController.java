package com.java5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java5.services.CookieService;
import com.java5.services.ParamService;
import com.java5.services.SessionService;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    CookieService cookieService;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;

    @GetMapping("/login")
    public String getLogin() {
        return "redirect:/products"; // Redirect to /products when accessing /account/login
    }

    @PostMapping("/login")
    public String postLogin(Model model) {
        // Get parameters using param service
        String username = paramService.getString("username", "");
        String password = paramService.getString("password", "");
        boolean remember = paramService.getBoolean("remember", false);

        // Login logic
        if ("khoib".equals(username) && "123".equals(password)) {
            sessionService.set("username", username);
            if (remember) {
                cookieService.add("username", username, 1);
                cookieService.add("password", password, 1);
                cookieService.add("remember", String.valueOf(remember), 1);
            } else {
                cookieService.remove("username");
                cookieService.remove("password");
                cookieService.remove("remember");
            }
            model.addAttribute("message", "Login thành công!");
            model.addAttribute("alertType", "success");
            return "redirect:/products";
        } else if ("admin".equals(username) && "123".equals(password)) {
            sessionService.set("username", username);
            if (remember) {
                cookieService.add("username", username, 1);
                cookieService.add("password", password, 1);
                cookieService.add("remember", String.valueOf(remember), 1);
            } else {
                cookieService.remove("username");
                cookieService.remove("password");
                cookieService.remove("remember");
            }
            model.addAttribute("message", "Login thành công!");
            model.addAttribute("alertType", "success");
            return "redirect:/admin";
        } else {
            model.addAttribute("message", "Login thất bại!");
            model.addAttribute("alertType", "danger");
            return "login"; // This should match the name of your JSP file without the extension
        }
    }

    @GetMapping("/logout")
    public String getLogout() {
        sessionService.remove("username");
        return "redirect:/products";
    }
}
