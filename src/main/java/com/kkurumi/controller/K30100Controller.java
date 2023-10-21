package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K30100Controller {

    String dir = "depth2/K30100/";

    @RequestMapping("/K30101")
    public String k30101(Model model) throws Exception {
        model.addAttribute("center",dir+"K30101");
        return "index";
    }

    @RequestMapping("/K30102")
    public String k30102(Model model) throws Exception {
        model.addAttribute("center",dir+"K30102");
        return "index";
    }

    @RequestMapping("/K30103")
    public String k30103(Model model) throws Exception {
        model.addAttribute("center",dir+"K30103");
        return "index";
    }

    @RequestMapping("/K30104")
    public String k30104(Model model) throws Exception {
        model.addAttribute("center",dir+"K30104");
        return "index";
    }

    @RequestMapping("/K30105")
    public String k30105(Model model) throws Exception {
        model.addAttribute("center",dir+"K30105");
        return "index";
    }

    @RequestMapping("/K30106")
    public String k30106(Model model) throws Exception {
        model.addAttribute("center",dir+"K30106");
        return "index";
    }




}
