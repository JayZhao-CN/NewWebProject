package com.learn.managesys.controller;


import com.learn.managesys.bean.Msg;
import com.learn.managesys.bean.Position;
import com.learn.managesys.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PositionController {

    @Autowired
    PositionService positionService;

//   返回职位数据
    @ResponseBody
    @RequestMapping("/positionList")
    public Msg getPositionList() {

        List<Position> positionList = positionService.getPositionList();

        return Msg.success().add("positionList",positionList);
    }
}
