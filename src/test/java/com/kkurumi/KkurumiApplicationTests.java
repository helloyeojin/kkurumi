package com.kkurumi;

import com.kkurumi.service.History_itemService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootTest
class KkurumiApplicationTests {

    @Autowired
    History_itemService his;
    @Test
    void contextLoads() {

    }

}
