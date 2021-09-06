package com.learn.managesys.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.learn.managesys.bean.Msg;
import com.learn.managesys.bean.User;
import com.learn.managesys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 处理用户增删改查
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;

    /**
     * 查询所有员工信息(分页查询)
     *
     * @return list<user></>
     */
//    @RequestMapping("/users")
    public String getAllUser(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             Model model) {

        //设置分页
        PageHelper.startPage(page, 8);
//查询数据
        List<User> all = userService.getAll();

        for (User user : all) {
            System.out.println(user.getuUsername());
        }
//包装数据
        //封装了详细的分页信息，查询到的数据
        //5 表示页面进度显示
        PageInfo pageInfo = new PageInfo(all, 5);

        model.addAttribute("pageInfo", pageInfo);

        return "userList";
    }

    /*返回Json形式数据*/
    @ResponseBody
    @RequestMapping("/user")
    public Msg getUserJson(@RequestParam(value = "page", defaultValue = "1") Integer page) {
//设置分页
        PageHelper.startPage(page, 8);
//查询数据
        List<User> all = userService.getAll();

        for (User user : all) {
            System.out.println(user.getuUsername());
        }
//包装数据
        //封装了详细的分页信息，查询到的数据
        //5 表示页面进度显示
        PageInfo pageInfo = new PageInfo(all, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * =======================================自定业务===================================
     */

//返回登录页面
    @RequestMapping("/")
    public String getLogin() {
        return ("index");
    }

    //验证账号密码
    @ResponseBody
    @RequestMapping("/verify")
    public Msg verifyUser(@RequestParam(value = "uPosition", required = false) Integer uPosition, @RequestParam(value = "uCode", required = false) Integer uCode, @RequestParam(value = "uPassword", required = false) String uPassword) {

//        Boolean result = userService.verifyUser(uPosition, uCode, uPassword);
        User user = userService.verifyUser(uPosition, uCode, uPassword);
        if (null != user) {
            if (user.getuPassword().equals(uPassword)) {
                session.setAttribute("uCompany",user.getuCompany().getCoCode());
                session.setAttribute("uCoName",user.getuCompany().getCoName());
                session.setAttribute("uUsername",user.getuUsername());
                session.setAttribute("uCode",uCode);
                return Msg.success().add("login_result", true).add("position",user.getuPosition());
            } else {
                return Msg.failed();
            }
        } else {
            System.out.println("未查询到数据");

            return Msg.failed();
        }

//        return Msg.success().add("login_result", result);

    }

//    @RequestMapping("/process")

    @RequestMapping(value = "/pages/{position}")
    public String pages(@PathVariable("position")Integer position, Model model,HttpSession session) {
        System.out.println(position);
        boolean isNew = session.isNew();
        if (!isNew){
        switch (position) {
            case 101:
                return "processor";
            case 102:
                return "quilteder";
            case 103:
                return "producer";
            case 104:
                return "backer";
            case 105:
                return "packer";
            default:return "index";
        }
        }else {
            return "forward:index";
        }
    }

    @ResponseBody
    @RequestMapping("/processSession")
    public Msg verifyUser() {

        return Msg.success().add("uCode",session.getAttribute("uCode")).add("uUsername",session.getAttribute("uUsername")).add("uCompany",session.getAttribute("uCompany")).add("uCoName",session.getAttribute("uCoName"));
    }

    @ResponseBody
    @RequestMapping("/deleteSession")
    public Msg deleteSession() {
        session.invalidate();
        return Msg.success();
    }
}
