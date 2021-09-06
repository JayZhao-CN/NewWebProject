package com.learn.managesys.dao;

import com.learn.managesys.bean.Position;
import java.util.List;

public interface PositionMapper {
    int deleteByPrimaryKey(Integer pId);

    int insert(Position record);

    Position selectByPrimaryKey(Integer pId);

    List<Position> selectAll();

    int updateByPrimaryKey(Position record);
}