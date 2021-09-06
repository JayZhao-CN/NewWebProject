package com.learn.managesys.bean;

public class Type {
    private Integer tId;

    private String tName;

    private Integer tCode;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public Integer gettCode() {
        return tCode;
    }

    public void settCode(Integer tCode) {
        this.tCode = tCode;
    }

    @Override
    public String toString() {
        return "Type{" +
                "tId=" + tId +
                ", tName='" + tName + '\'' +
                ", tCode=" + tCode +
                '}';
    }
}