package com.kkurumi.controller;

import javax.servlet.http.HttpSession;
import com.kkurumi.service.CustService;
import com.kkurumi.dto.Cust;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class LoginController {

    String dir = "/";

    @RequestMapping("/login")
    public String signin(Model model) throws Exception {
        model.addAttribute("center", dir + "login");
        return "login";
    }

//    @RequestMapping(value = "/loginImpl", method = RequestMethod.POST) // POST 요청으로 변경
//    public String loginImpl(Model model, String user_id, HttpSession session) {
//
//        Cust cust = null;
//        try {
//            cust = CustService.get(user_id);
//            if (cust != null) {
//                session.setMaxInactiveInterval(1000000);
//                session.setAttribute("loginCust", cust);
//                model.addAttribute("center", "center");
//                return "redirect:/";
//            } else {
//                model.addAttribute("msg", "아이디를 확인하세요.");
//                model.addAttribute("center", "login");
//                return "index";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "index";
//    }
}