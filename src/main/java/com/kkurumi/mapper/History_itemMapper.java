package com.kkurumi.mapper;

import com.kkurumi.dto.History_item;
import com.kkurumi.frame.kkurumiMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface History_itemMapper extends kkurumiMapper<Integer, History_item> {

}
