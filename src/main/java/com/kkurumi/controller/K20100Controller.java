package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K20100Controller {

    String dir = "depth2/K20100/";

    @RequestMapping("/K20101")
    public String k20101(Model model) throws Exception {
        model.addAttribute("center",dir+"K20101");
        return "index";
    }

    @RequestMapping("/K20102")
    public String k20102(Model model) throws Exception {
        model.addAttribute("center",dir+"K20102");
        return "index";
    }

    @RequestMapping("/K20103")
    public String k20103(Model model) throws Exception {
        model.addAttribute("center",dir+"K20103");
        return "index";
    }

    @RequestMapping("/K20104")
    public String k20104(Model model) throws Exception {
        model.addAttribute("center",dir+"K20104");
        return "index";
    }

    @RequestMapping("/K20105")
    public String k20105(Model model) throws Exception {
        model.addAttribute("center",dir+"K20105");
        return "index";
    }

    @RequestMapping("/K20106")
    public String k20106(Model model) throws Exception {
        model.addAttribute("center",dir+"K20106");
        return "index";
    }




}
