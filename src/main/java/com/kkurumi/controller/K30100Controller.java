package com.kkurumi.controller;


import com.kkurumi.dto.History_item;
import com.kkurumi.service.History_itemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class K30100Controller {

    String dir = "depth2/K30100/";

    @Autowired
    History_itemService historyItemService;

    @RequestMapping("/K30101")
    public String k30101(Model model) throws Exception {
        int item_id = 30101;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K30101");
        return "index";
    }

    @RequestMapping("/K30102")
    public String k30102(Model model) throws Exception {
        int item_id = 30102;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K30102");
        return "index";
    }

    @RequestMapping("/K30103")
    public String k30103(Model model) throws Exception {
        int item_id = 30103;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K30103");
        return "index";
    }

    @RequestMapping("/K30104")
    public String k30104(Model model) throws Exception {
        int item_id = 30104;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);

        model.addAttribute("center",dir+"K30104");
        return "index";
    }

    @RequestMapping("/K30105")
    public String k30105(Model model) throws Exception {
        int item_id = 30105;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K30105");
        return "index";
    }

    @RequestMapping("/K30106")
    public String k30106(Model model) throws Exception {
        int item_id = 30106;

        //history_item 테이블 적재
        History_item history_item1 = new History_item(item_id, 0);
        historyItemService.register(history_item1);


        model.addAttribute("center",dir+"K30106");
        return "index";
    }




}
