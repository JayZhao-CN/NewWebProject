package com.learn.managesys.service;

import com.learn.managesys.bean.*;
import com.learn.managesys.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClothesService {

    @Autowired
    ClothesMapper clothesMapper;
    @Autowired
    TypeMapper typeMapper;
    @Autowired
    StyleMapper styleMapper;
    @Autowired
    SizeMapper sizeMapper;
    @Autowired
    ColorMapper colorMapper;

    public List<Clothes> getClothes(){

        return clothesMapper.selectAddClothes();

    }

//根据日期条件查询
    public List<Clothes> selectProcessorClothes(Clothes clothes){
        return clothesMapper.selectClothesByExamples(clothes);
    }

    //根据是否加工条件查询
    public List<Clothes> selectProducerClothes(Clothes clothes){
        return clothesMapper.selectClothesByExamples(clothes);
    }

    //查询模态框数据
    public Map<String ,Object> selectModal(){

        Map<String ,Object> map = new HashMap<>();
        List<Style> styles = styleMapper.selectAll();
        map.put("styles",styles);
        List<Type> types = typeMapper.selectAll();
        map.put("types",types);
        List<Color> colors = colorMapper.selectAll();
        map.put("colors",colors);
        List<Size> sizes = sizeMapper.selectAll();
        map.put("sizes",sizes);
        return map;
    }

    //插入数据
    public Integer insertClothes(Clothes clothes){
        return clothesMapper.insertClothes(clothes);
    }

    //查询机工选择的服装信息
    public List<Clothes> selectClothesById(Integer id){
        return clothesMapper.selectClothesByExamples(new Clothes(id));
    }

    //修改数据
    public Integer updateClothes(Clothes clothes){
        return clothesMapper.updateById(clothes);
    }
}
