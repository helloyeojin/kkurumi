package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10100Controller {

    String dir = "depth2/K10100/";

    @RequestMapping("/K10101")
    public String k10101(Model model) throws Exception {
        model.addAttribute("center",dir+"K10101");
        return "index";
    }

    @RequestMapping("/K10102")
    public String k10102(Model model) throws Exception {
        model.addAttribute("center",dir+"K10102");
        return "index";
    }

    @RequestMapping("/K10103")
    public String k10103(Model model) throws Exception {
        model.addAttribute("center",dir+"K10103");
        return "index";
    }




}
