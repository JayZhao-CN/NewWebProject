package com.learn.managesys.bean;

public class Style {
    private Integer sId;

    private String sName;

    private Integer sCode;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public Integer getsCode() {
        return sCode;
    }

    public void setsCode(Integer sCode) {
        this.sCode = sCode;
    }

    @Override
    public String toString() {
        return "Style{" +
                "sId=" + sId +
                ", sName='" + sName + '\'' +
                ", sCode=" + sCode +
                '}';
    }
}