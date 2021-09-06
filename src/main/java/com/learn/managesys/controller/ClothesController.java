package com.learn.managesys.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.learn.managesys.bean.Clothes;
import com.learn.managesys.bean.Msg;
import com.learn.managesys.service.ClothesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class ClothesController {
    @Autowired
    ClothesService clothesService;

    @ResponseBody
    @RequestMapping("/clothes")
    public Msg getClothes(@RequestParam(value = "page", defaultValue = "1") Integer page) {

        System.out.println("页面请求：" + page);
        //设置分页
        PageHelper.startPage(page, 5);
        List<Clothes> clothes = clothesService.getClothes();

        System.out.println(clothes);

        return Msg.success().add("pageInfo", new PageInfo(clothes, 5));
    }


    //    通过日期查询
    @ResponseBody
    @RequestMapping("/select/processor")
    public Msg selectProcessorClothes(@RequestParam(value = "page", defaultValue = "1") Integer page) throws ParseException {

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        Date date1 = simpleDateFormat.parse(format);

//设置分页
        PageHelper.startPage(page, 5);
        List<Clothes> clothes = clothesService.selectProcessorClothes(new Clothes(null, date1));
        return Msg.success().add("pageInfo", new PageInfo(clothes, 5));
    }

    //    通过是否机工查询
    @ResponseBody
    @RequestMapping("/select/producer")
    public Msg selectProducerClothes(@RequestParam(value = "page", defaultValue = "1") Integer page) throws ParseException {
//设置分页
        PageHelper.startPage(page, 5);
        List<Clothes> clothes = clothesService.selectProducerClothes(new Clothes(null,10000));
        return Msg.success().add("pageInfo", new PageInfo(clothes, 5));
    }


    //查询模态框选型数据
    @ResponseBody
    @RequestMapping("/modal")
    public Msg getModal() {

        Map<String, Object> map = clothesService.selectModal();

        return Msg.success().add("data", map);
    }

    //获取提交数据
    @ResponseBody
    @PostMapping("/add_clothes")
    public Msg insertClothes(Clothes clothes, HttpSession session) {
        Integer uCompany = (Integer) session.getAttribute("uCompany");
        Integer uCode = (Integer) session.getAttribute("uCode");
        clothes.setcTypeCode(100);
        clothes.setcCompanyCode(uCompany);
        clothes.setcProcessorCode(uCode);
        clothes.setcProducerCode(10000);
        Date date = new Date(System.currentTimeMillis());
        clothes.setcTimeProcess(date);
        clothes.setcTimeProduce(date);
        System.out.println(clothes);
        Integer integer = null;
        if (session.getAttribute("uCode")!= null && session.getAttribute("uCompany")!= null ) {
            try {
                integer = clothesService.insertClothes(clothes);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(integer);
        if (integer != null) {
            if (integer > 0) {
                return Msg.success();
            } else {
                return Msg.failed();
            }
        } else {
            return Msg.failed();
        }

    }


    //获取提交数据
    @ResponseBody
    @PostMapping("/select_clothes_id")
    public Msg selectClothesById(@RequestParam("cId")Integer cId) {
        System.out.println(cId);
        List<Clothes> clothes = clothesService.selectClothesById(cId);
        return Msg.success().add("clothes",clothes);
    }


    //获取修改数据
    @ResponseBody
    @PostMapping("/selected_clothes")
    public Msg updateClothes(@RequestParam("cId")Integer cId, HttpSession session) {

        Integer integer = null;
        if (session.getAttribute("uCode")!= null && session.getAttribute("uCompany")!= null ) {
            try {
                Integer uCode = (Integer) session.getAttribute("uCode");
                Date date = new Date(System.currentTimeMillis());
                integer = clothesService.updateClothes(new Clothes(cId,uCode,date));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(integer);
        if (integer != null) {
            if (integer > 0) {
                return Msg.success();
            } else {
                return Msg.failed();
            }
        } else {
            return Msg.failed();
        }

    }

}
