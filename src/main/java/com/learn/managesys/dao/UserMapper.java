package com.learn.managesys.dao;

import com.learn.managesys.bean.User;
import java.util.List;

public interface UserMapper {

    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    User selectByPrimaryKey(Integer uId);

    //查询含有职位信息的列表
    List<User> selectAllWithPosition();

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    User selectByPassword(Integer uCode);
}