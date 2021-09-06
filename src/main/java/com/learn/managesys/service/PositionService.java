package com.learn.managesys.service;

import com.learn.managesys.bean.Position;
import com.learn.managesys.dao.PositionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionService {

    @Autowired
    PositionMapper positionMapper;

    public List<Position> getPositionList(){

        List<Position> positions = positionMapper.selectAll();

        return positions;
    }
}
