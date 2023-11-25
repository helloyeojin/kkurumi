package com.kkurumi.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private int user_pin;
    private String user_name;
    private String user_id;
    private String gender;
    private Date birthday;
    private String address1;
    private String address2;
    private int job;
    private int credit;

    public Cust(String user_name) {
        this.user_name = user_name;
    }
}


