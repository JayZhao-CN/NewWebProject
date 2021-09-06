package com.learn.managesys.dao;

import com.learn.managesys.bean.Company;
import java.util.List;

public interface CompanyMapper {
    int deleteByPrimaryKey(Integer coId);

    int insert(Company record);

    Company selectByPrimaryKey(Integer coId);

    List<Company> selectAll();

    int updateByPrimaryKey(Company record);
}