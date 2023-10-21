package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Depth1Controller {

    String dir = "depth1/";

    @RequestMapping("/K10100")
    public String k10100(Model model) throws Exception {
        model.addAttribute("center",dir+"K10100");
        return "index";
    }

    @RequestMapping("/K10200")
    public String k10200(Model model) throws Exception {
        model.addAttribute("center",dir+"K10200");
        return "index";
    }

    @RequestMapping("/K10300")
    public String k10300(Model model) throws Exception {
        model.addAttribute("center",dir+"K10300");
        return "index";
    }

    @RequestMapping("/K20100")
    public String k20100(Model model) throws Exception {
        model.addAttribute("center",dir+"K20100");
        return "index";
    }

    @RequestMapping("/K20200")
    public String k20200(Model model) throws Exception {
        model.addAttribute("center",dir+"K20200");
        return "index";
    }

    @RequestMapping("/K30100")
    public String k30100(Model model) throws Exception {
        model.addAttribute("center",dir+"K30100");
        return "index";
    }





}
