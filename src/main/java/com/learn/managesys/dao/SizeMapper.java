package com.learn.managesys.dao;

import com.learn.managesys.bean.Size;
import java.util.List;

public interface SizeMapper {
    int deleteByPrimaryKey(Integer siId);

    int insert(Size record);

    Size selectByPrimaryKey(Integer siId);

    List<Size> selectAll();

    int updateByPrimaryKey(Size record);
}