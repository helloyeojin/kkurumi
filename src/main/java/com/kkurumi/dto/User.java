package com.kkurumi.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class User {
    private int userpin;
    private String username;
    private String userid;
    private String gender;
    private Date birthday;
    private String address1;
    private String address2;
    private int income;
    private String job;
    private String credit;
}
