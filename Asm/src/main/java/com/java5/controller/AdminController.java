package com.java5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java5.services.CookieService;
import com.java5.services.ParamService;
import com.java5.services.SessionService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
    CookieService cookieService;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;
    
    @GetMapping
    public String adminHome(Model model) {
        String username = sessionService.get("username");
        if (username == null || !username.equals("admin")) {
            model.addAttribute("message", "Access denied! Admins only.");
            return "redirect:/account/login";
        }
        model.addAttribute("message", "Welcome to the Admin Dashboard, " + username);
        return "admin"; // Ensure you have an admin/dashboard.jsp file
    }
    
    @GetMapping("/add")
    public String addPage(Model model) {
        String username = sessionService.get("username");
        if (username == null || !username.equals("admin")) {
            model.addAttribute("message", "Access denied! Admins only.");
            return "redirect:/account/login";
        }
        return "add"; // Ensure you have an admin/add.jsp file
    }

    @GetMapping("/update")
    public String updatePage(Model model) {
        String username = sessionService.get("username");
        if (username == null || !username.equals("admin")) {
            model.addAttribute("message", "Access denied! Admins only.");
            return "redirect:/account/login";
        }
        return "update"; // Ensure you have an admin/update.jsp file
    }
}
