package com.kkurumi.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class History_item {
    private int item_id;
    private int user_pin;
}
