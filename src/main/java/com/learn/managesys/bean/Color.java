package com.learn.managesys.bean;

public class Color {
    private Integer colId;

    private String colName;

    private Integer colCode;

    public Color() {
    }

    public Color(Integer colId, String colName, Integer colCode) {
        this.colId = colId;
        this.colName = colName;
        this.colCode = colCode;
    }

    public Color(String colName, Integer colCode) {
        this.colName = colName;
        this.colCode = colCode;
    }

    public Integer getColId() {
        return colId;
    }

    public void setColId(Integer colId) {
        this.colId = colId;
    }

    public String getColName() {
        return colName;
    }

    public void setColName(String colName) {
        this.colName = colName;
    }

    public Integer getColCode() {
        return colCode;
    }

    public void setColCode(Integer colCode) {
        this.colCode = colCode;
    }
}