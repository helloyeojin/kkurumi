package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10300Controller {

    String dir = "depth2/K10300/";

    @RequestMapping("/K10301")
    public String k10301(Model model) throws Exception {
        model.addAttribute("center",dir+"K10301");
        return "index";
    }

    @RequestMapping("/K10302")
    public String k10302(Model model) throws Exception {
        model.addAttribute("center",dir+"K10302");
        return "index";
    }

    @RequestMapping("/K10303")
    public String k10303(Model model) throws Exception {
        model.addAttribute("center",dir+"K10303");
        return "index";
    }

    @RequestMapping("/K10304")
    public String k10304(Model model) throws Exception {
        model.addAttribute("center",dir+"K10304");
        return "index";
    }




}
