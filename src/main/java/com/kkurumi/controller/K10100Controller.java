package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10100Controller {

    String dir = "depth2/K10100/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K10101")
    public String k10101(Model model, History_item history_item) throws Exception {
        History_item historyItem = new History_item(10101, 0000000000);
       historyItemService.register(historyItem);
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
