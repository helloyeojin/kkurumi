package com.kkurumi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class HistoryClick {
    private String pageid;
    private int age;
    private String address1;
    private String address2;
    private String gender;
    private int income;
    private String job;
    private String credit;
}
