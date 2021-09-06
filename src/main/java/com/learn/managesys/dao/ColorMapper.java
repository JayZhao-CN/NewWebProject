package com.learn.managesys.dao;

import com.learn.managesys.bean.Color;
import java.util.List;

public interface ColorMapper {
    int deleteByPrimaryKey(Integer colId);

    int insert(Color record);

    Color selectByPrimaryKey(Integer colId);

    List<Color> selectAll();

    int updateByPrimaryKey(Color record);
}