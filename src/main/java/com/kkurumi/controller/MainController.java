package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {



    @RequestMapping("/")
    public String main() throws Exception {
        return "index";
    }

    @RequestMapping("/E00001")
    public String e00001(Model model) throws Exception {
        model.addAttribute("center","etc/"+"E00001");
        return "index";
    }

    @RequestMapping("/L00001")
    public String l00001(Model model) throws Exception {
        model.addAttribute("center","etc/"+"L00001");
        return "index";
    }


}
