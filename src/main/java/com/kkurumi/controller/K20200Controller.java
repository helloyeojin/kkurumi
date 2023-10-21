package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K20200Controller {

    String dir = "depth2/K20200/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K20201")
    public String k20201(Model model) throws Exception {
        int item_id = 20201;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20201");
        return "index";
    }

    @RequestMapping("/K20202")
    public String k20202(Model model) throws Exception {
        int item_id = 20202;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20202");
        return "index";
    }

    @RequestMapping("/K20203")
    public String k20203(Model model) throws Exception {
        int item_id = 20203;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K20203");
        return "index";
    }




}
