package com.kkurumi.service;

import com.kkurumi.dto.History_item;
import com.kkurumi.frame.kkurumiService;
import com.kkurumi.mapper.History_itemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class History_itemService implements kkurumiService<Integer, History_item> {

    @Autowired
    History_itemMapper mapper;


    @Override
    public void register(History_item historyItem) throws Exception {
        mapper.insert(historyItem);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(History_item historyItem) throws Exception {

    }

    @Override
    public History_item get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<History_item> get() throws Exception {
        return null;
    }
}
