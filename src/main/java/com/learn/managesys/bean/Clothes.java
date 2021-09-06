package com.learn.managesys.bean;

import java.util.Date;

public class Clothes {
    private Integer cId;

    private Company cCompany;

    private Integer cCompanyCode;

    private Integer cNumCut;

    private Type cType;

    private Integer cTypeCode;

    private Style cStyle;

    private Integer cStyleCode;

    private Color cColor;

    private Integer cColorCode;

    private Size cSize;

    private Integer cSizeCode;

    private User cUser;

    private Integer cProcessorCode;

    private Integer cProducerCode;

    private Integer cNumCount;

    private Date cTimeProduce;
//    private String cTimeProduce;

    private Date cTimeProcess;
//    private String cTimeProcess;

    private String cRemark;


    public Clothes() {
    }

    //全参
    public Clothes(Integer cId, Company cCompany, Integer cCompanyCode, Integer cNumCut, Type cType, Integer cTypeCode, Style cStyle, Integer cStyleCode, Color cColor, Integer cColorCode, Size cSize, Integer cSizeCode, User cUser, Integer cProcessorCode, Integer cProducerCode, Integer cNumCount, Date cTimeProduce, Date cTimeProcess, String cRemark) {
        this.cId = cId;
        this.cCompany = cCompany;
        this.cCompanyCode = cCompanyCode;
        this.cNumCut = cNumCut;
        this.cType = cType;
        this.cTypeCode = cTypeCode;
        this.cStyle = cStyle;
        this.cStyleCode = cStyleCode;
        this.cColor = cColor;
        this.cColorCode = cColorCode;
        this.cSize = cSize;
        this.cSizeCode = cSizeCode;
        this.cUser = cUser;
        this.cProcessorCode = cProcessorCode;
        this.cProducerCode = cProducerCode;
        this.cNumCount = cNumCount;
        this.cTimeProduce = cTimeProduce;
        this.cTimeProcess = cTimeProcess;
        this.cRemark = cRemark;
    }

    //裁剪或者机工数据查询条件构造器
    public Clothes(Integer cProcessorCode, Integer cProducerCode) {
        this.cProcessorCode = cProcessorCode;
        this.cProducerCode = cProducerCode;
    }

    //裁剪时间和加工时间构造器
    public Clothes(Date cTimeProduce, Date cTimeProcess) {
        this.cTimeProduce = cTimeProduce;
        this.cTimeProcess = cTimeProcess;
    }

    //插入数据构造器
    public Clothes(Integer cCompanyCode, Integer cNumCut, Integer cTypeCode, Integer cStyleCode, Integer cColorCode, Integer cSizeCode, Integer cProcessorCode, Integer cProducerCode, Integer cNumCount, Date cTimeProduce, Date cTimeProcess) {
        this.cCompanyCode = cCompanyCode;
        this.cNumCut = cNumCut;
        this.cTypeCode = cTypeCode;
        this.cStyleCode = cStyleCode;
        this.cColorCode = cColorCode;
        this.cSizeCode = cSizeCode;
        this.cProcessorCode = cProcessorCode;
        this.cProducerCode = cProducerCode;
        this.cNumCount = cNumCount;
        this.cTimeProduce = cTimeProduce;
        this.cTimeProcess = cTimeProcess;
    }

    //仅有Id的构造器
    public Clothes(Integer cId) {
        this.cId = cId;
    }

    public Clothes(Integer cId, Integer cProducerCode, Date cTimeProduce) {
        this.cId = cId;
        this.cProducerCode = cProducerCode;
        this.cTimeProduce = cTimeProduce;
    }

    public Integer getcProducerCode() {
        return cProducerCode;
    }

    public void setcProducerCode(Integer cProducerCode) {
        this.cProducerCode = cProducerCode;
    }

    public Integer getcCompanyCode() {
        return cCompanyCode;
    }

    public void setcCompanyCode(Integer cCompanyCode) {
        this.cCompanyCode = cCompanyCode;
    }

    public Integer getcTypeCode() {
        return cTypeCode;
    }

    public void setcTypeCode(Integer cTypeCode) {
        this.cTypeCode = cTypeCode;
    }

    public Integer getcStyleCode() {
        return cStyleCode;
    }

    public void setcStyleCode(Integer cStyleCode) {
        this.cStyleCode = cStyleCode;
    }

    public Color getcColor() {
        return cColor;
    }

    public void setcColor(Color cColor) {
        this.cColor = cColor;
    }

    public Integer getcColorCode() {
        return cColorCode;
    }

    public void setcColorCode(Integer cColorCode) {
        this.cColorCode = cColorCode;
    }

    public Integer getcProcessorCode() {
        return cProcessorCode;
    }

    public void setcProcessorCode(Integer cProcessorCode) {
        this.cProcessorCode = cProcessorCode;
    }

    public Size getcSize() {
        return cSize;
    }

    public void setcSize(Size cSize) {
        this.cSize = cSize;
    }

    public Integer getcSizeCode() {
        return cSizeCode;
    }

    public void setcSizeCode(Integer cSizeCode) {
        this.cSizeCode = cSizeCode;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Company getcCompany() {
        return cCompany;
    }

    public void setcCompany(Company cCompany) {
        this.cCompany = cCompany;
    }

    public Integer getcNumCut() {
        return cNumCut;
    }

    public void setcNumCut(Integer cNumCut) {
        this.cNumCut = cNumCut;
    }

    public Type getcType() {
        return cType;
    }

    public void setcType(Type cType) {
        this.cType = cType;
    }

    public Style getcStyle() {
        return cStyle;
    }

    public void setcStyle(Style cStyle) {
        this.cStyle = cStyle;
    }

    public User getcUser() {
        return cUser;
    }

    public void setcUser(User cUser) {
        this.cUser = cUser;
    }

    public Integer getcNumCount() {
        return cNumCount;
    }

    public void setcNumCount(Integer cNumCount) {
        this.cNumCount = cNumCount;
    }

    public Date getcTimeProduce() {
        return cTimeProduce;
    }

    public void setcTimeProduce(Date cTimeProduce) {
        this.cTimeProduce = cTimeProduce;
    }

    public Date getcTimeProcess() {
        return cTimeProcess;
    }

    public void setcTimeProcess(Date cTimeProcess) {
        this.cTimeProcess = cTimeProcess;
    }

    public String getcRemark() {
        return cRemark;
    }

    public void setcRemark(String cRemark) {
        this.cRemark = cRemark;
    }

    @Override
    public String toString() {
        return "Clothes{" +
                "cId=" + cId +
                ", cCompany=" + cCompany +
                ", cCompanyCode=" + cCompanyCode +
                ", cNumCut=" + cNumCut +
                ", cType=" + cType +
                ", cTypeCode=" + cTypeCode +
                ", cStyle=" + cStyle +
                ", cStyleCode=" + cStyleCode +
                ", cColor=" + cColor +
                ", cColorCode=" + cColorCode +
                ", cSize=" + cSize +
                ", cSizeCode=" + cSizeCode +
                ", cUser=" + cUser +
                ", cProcessorCode=" + cProcessorCode +
                ", cProducerCode=" + cProducerCode +
                ", cNumCount=" + cNumCount +
                ", cTimeProduce=" + cTimeProduce +
                ", cTimeProcess=" + cTimeProcess +
                ", cRemark='" + cRemark + '\'' +
                '}';
    }
}