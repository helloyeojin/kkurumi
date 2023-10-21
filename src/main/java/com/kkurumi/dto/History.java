package com.kkurumi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class History {
    private int userpin;
    private String prevpage;
    private String nowpage;
    private String entertime;
}
