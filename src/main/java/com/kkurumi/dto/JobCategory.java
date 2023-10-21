package com.kkurumi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class JobCategory {
    private String employee;
    private String soho;
    private String unemployed;
    private String student;
    private String householder;
}
