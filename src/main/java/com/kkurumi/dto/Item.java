package com.kkurumi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private int itemid;
    private String itemname;
    private int categoryid;
    private String itemdetail;
}
