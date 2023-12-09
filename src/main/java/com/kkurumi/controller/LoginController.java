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

    @RequestMapping("/loginImpl")
    public String loginImpl(Model model, String user_name, HttpSession session) {

        Cust cust = new Cust(user_name);
        try {
            if (cust != null) {
                log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ cust.getUser_name());
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("loginCust", cust);
                session.setAttribute("user_name", user_name);
                model.addAttribute("center", "center");
                if("admin".equals(user_name)) {
                    return "redirect:/B00002";
                } else {
                    return "redirect:/";
                }
            } else {
                log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@222"+ cust.getUser_name());
                model.addAttribute("msg", "아이디를 확인하세요.");
                model.addAttribute("center", "login");
                return "index";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping("logoutImpl")
    public String logoutimpl(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
}