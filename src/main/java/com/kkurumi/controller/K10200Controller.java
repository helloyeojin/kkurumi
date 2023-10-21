package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K10200Controller {

    String dir = "depth2/K10200/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K10201")
    public String k10201(Model model) throws Exception {
        int item_id = 10201;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K10201");
        return "index";
    }

    @RequestMapping("/K10202")
    public String k10202(Model model) throws Exception {
        int item_id = 10202;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K10202");
        return "index";
    }





}
