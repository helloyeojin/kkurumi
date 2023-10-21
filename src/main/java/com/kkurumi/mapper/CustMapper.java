package com.kkurumi.mapper;

import com.kkurumi.dto.Cust;
import com.kkurumi.frame.kkurumiMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustMapper extends kkurumiMapper<String, Cust> {
    public void updatePwd(Cust cust);

}