package com.learn.managesys.dao;

import com.learn.managesys.bean.Style;
import java.util.List;

public interface StyleMapper {
    int deleteByPrimaryKey(Integer sId);

    int insert(Style record);

    Style selectByPrimaryKey(Integer sId);

    List<Style> selectAll();

    int updateByPrimaryKey(Style record);
}