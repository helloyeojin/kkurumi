package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K20100Controller {

    String dir = "depth2/K20100/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K20101")
    public String k20101(Model model) throws Exception {
        int item_id = 20101;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20101");
        return "index";
    }

    @RequestMapping("/K20102")
    public String k20102(Model model) throws Exception {
        int item_id = 20102;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20102");
        return "index";
    }

    @RequestMapping("/K20103")
    public String k20103(Model model) throws Exception {
        int item_id = 20103;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20103");
        return "index";
    }

    @RequestMapping("/K20104")
    public String k20104(Model model) throws Exception {
        int item_id = 20104;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20104");
        return "index";
    }

    @RequestMapping("/K20105")
    public String k20105(Model model) throws Exception {
        int item_id = 20105;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20105");
        return "index";
    }

    @RequestMapping("/K20106")
    public String k20106(Model model) throws Exception {
        int item_id = 20106;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20106");
        return "index";
    }




}
