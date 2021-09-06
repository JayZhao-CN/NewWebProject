package com.learn.managesys.dao;

import com.learn.managesys.bean.Clothes;
import java.util.List;

public interface ClothesMapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(Clothes record);

    Clothes selectByPrimaryKey(Integer cId);

    List<Clothes> selectAll();

//    List<Clothes> selectWithCompany();
//
    List<Clothes> selectAddClothes();

    List<Clothes> selectClothesByExamples(Clothes clothes);

    List<Clothes> selectModal();

    int insertClothes(Clothes clothes);

    int updateByPrimaryKey(Clothes record);

    int updateById(Clothes clothes);
}