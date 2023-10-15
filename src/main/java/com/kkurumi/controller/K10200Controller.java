package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10200Controller {

    String dir = "depth2/K10200/";

    @RequestMapping("/K10201")
    public String k10201(Model model) throws Exception {
        model.addAttribute("center",dir+"K10201");
        return "index";
    }

    @RequestMapping("/K10202")
    public String k10202(Model model) throws Exception {
        model.addAttribute("center",dir+"K10202");
        return "index";
    }





}
