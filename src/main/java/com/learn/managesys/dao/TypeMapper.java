package com.learn.managesys.dao;

import com.learn.managesys.bean.Type;
import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer tId);

    int insert(Type record);

    Type selectByPrimaryKey(Integer tId);

    List<Type> selectAll();

    int updateByPrimaryKey(Type record);
}