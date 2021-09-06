package com.learn.managesys.bean;

import java.util.Date;

public class User {
    private Integer uId;

    private String uUsername;

    private Company uCompany;

    public Company getuCompany() {
        return uCompany;
    }

    public void setuCompany(Company uCompany) {
        this.uCompany = uCompany;
    }

    private Integer uCode;

    private String uPassword;

    private String uPhone;

    private Integer uPosition;

    private Position uPositionName;

    private Date uTimeStart;

    private Date uTimeEnd;

    private String processor;

    private String producer;

    public String getProcessor() {
        return processor;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }


    public User() {
    }

    public User(Integer uId, String uUsername, Company uCompany, Integer uCode, String uPassword, String uPhone, Integer uPosition, Position uPositionName, Date uTimeStart, Date uTimeEnd, String processor, String producer) {
        this.uId = uId;
        this.uUsername = uUsername;
        this.uCompany = uCompany;
        this.uCode = uCode;
        this.uPassword = uPassword;
        this.uPhone = uPhone;
        this.uPosition = uPosition;
        this.uPositionName = uPositionName;
        this.uTimeStart = uTimeStart;
        this.uTimeEnd = uTimeEnd;
        this.processor = processor;
        this.producer = producer;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuUsername() {
        return uUsername;
    }

    public void setuUsername(String uUsername) {
        this.uUsername = uUsername;
    }

    public Integer getuCode() {
        return uCode;
    }

    public void setuCode(Integer uCode) {
        this.uCode = uCode;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public Integer getuPosition() {
        return uPosition;
    }

    public void setuPosition(Integer uPosition) {
        this.uPosition = uPosition;
    }


    //自定义添加职位信息
    public Position getuPositionName() {
        return uPositionName;
    }

    public void setuPositionName(Position uPositionName) {
        this.uPositionName = uPositionName;
    }

    public Date getuTimeStart() {
        return uTimeStart;
    }

    public void setuTimeStart(Date uTimeStart) {
        this.uTimeStart = uTimeStart;
    }

    public Date getuTimeEnd() {
        return uTimeEnd;
    }

    public void setuTimeEnd(Date uTimeEnd) {
        this.uTimeEnd = uTimeEnd;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uUsername='" + uUsername + '\'' +
                ", uCompany=" + uCompany +
                ", uCode=" + uCode +
                ", uPassword='" + uPassword + '\'' +
                ", uPhone='" + uPhone + '\'' +
                ", uPosition=" + uPosition +
                ", uPositionName=" + uPositionName +
                ", uTimeStart=" + uTimeStart +
                ", uTimeEnd=" + uTimeEnd +
                ", processor='" + processor + '\'' +
                ", producer='" + producer + '\'' +
                '}';
    }
}