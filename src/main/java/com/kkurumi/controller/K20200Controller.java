package com.kkurumi.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K20200Controller {

    String dir = "depth2/K20200/";

    @RequestMapping("/K20201")
    public String k20201(Model model) throws Exception {
        model.addAttribute("center",dir+"K20201");
        return "index";
    }

    @RequestMapping("/K20202")
    public String k20202(Model model) throws Exception {
        model.addAttribute("center",dir+"K20202");
        return "index";
    }

    @RequestMapping("/K20203")
    public String k20203(Model model) throws Exception {
        model.addAttribute("center",dir+"K20203");
        return "index";
    }




}
