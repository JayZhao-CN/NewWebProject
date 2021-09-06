package com.learn.managesys.service;


import com.learn.managesys.bean.User;
import com.learn.managesys.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    HttpSession session;

    public List<User> getAll() {

        List<User> users = userMapper.selectAll();
        return users;
    }

    public User verifyUser(Integer uPosition, Integer uCode, String uPassword) {

        return userMapper.selectByPassword(uCode);
//        if (null != user) {
//            if (user.getuPassword().equals(uPassword)) {
//                session.setAttribute("uCompany",user.getuCompany().getCoCode());
//                session.setAttribute("uCoName",user.getuCompany().getCoName());
//                session.setAttribute("uUsername",user.getuUsername());
//                session.setAttribute("uCode",uCode);
//                return user;
//            } else {
//                return false;
//            }
//        } else {
//            System.out.println("未查询到数据");
//
//            return false;
//        }

    }
}
