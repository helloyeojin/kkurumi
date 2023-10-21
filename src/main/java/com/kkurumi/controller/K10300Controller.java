package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10300Controller {

    String dir = "depth2/K10300/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K10301")
    public String k10301(Model model) throws Exception {
        int item_id = 10301;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K10301");
        return "index";
    }

    @RequestMapping("/K10302")
    public String k10302(Model model) throws Exception {
        int item_id = 10302;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K10302");
        return "index";
    }

    @RequestMapping("/K10303")
    public String k10303(Model model) throws Exception {
        int item_id = 10303;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K10303");
        return "index";
    }

    @RequestMapping("/K10304")
    public String k10304(Model model) throws Exception {
        int item_id = 10304;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K10304");
        return "index";
    }




}
