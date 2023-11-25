package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    String dir = "admin/";

    @RequestMapping("/B00001")
    public String b00001(Model model) throws Exception {
        model.addAttribute("center",dir+"B00001");
        return "index";
    }


    @RequestMapping("/B00002")
    public String b00002(Model model) throws Exception {
        model.addAttribute("center",dir+"B00002");
        return "index";
    }


    @RequestMapping("/B00003")
    public String b00003(Model model) throws Exception {
        model.addAttribute("center",dir+"B00003");
        return "index";
    }

    @RequestMapping("/B00004")
    public String b00004(Model model) throws Exception {
        model.addAttribute("center",dir+"B00004");
        return "index";
    }


}
