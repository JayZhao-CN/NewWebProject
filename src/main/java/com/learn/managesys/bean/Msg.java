package com.learn.managesys.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 显示返回信息
 */
public class Msg {
    //状态码
    private int code;
    //信息
    private String msg;
    //用户返回信息
    private Map<String ,Object> dataInfo = new HashMap<>();

    //返回成功
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("返回成功");
        return result;
    }
    //返回失败
    public static Msg failed(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("返回失败");
        return result;
    }

    //链式add
    public Msg add(String key,Object value){
        this.getDataInfo().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getDataInfo() {
        return dataInfo;
    }

    public void setDataInfo(Map<String, Object> dataInfo) {
        this.dataInfo = dataInfo;
    }
}
