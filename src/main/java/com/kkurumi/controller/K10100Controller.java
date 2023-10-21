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
    public String k10101(Model model) throws Exception {
        int item_id = 10101;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K10101");
        return "index";
    }

    @RequestMapping("/K10102")
    public String k10102(Model model) throws Exception {
        int item_id = 10102;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K10102");
        return "index";
    }

    @RequestMapping("/K10103")
    public String k10103(Model model) throws Exception {
        int item_id = 10103;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K10103");
        return "index";
    }




}
