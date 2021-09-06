package com.learn.managesys.bean;

public class Company {
    private Integer coId;

    private String coName;

    private Integer coCode;

    private Integer coLeader;

    private String coState;

    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public String getCoName() {
        return coName;
    }

    public void setCoName(String coName) {
        this.coName = coName;
    }

    public Integer getCoCode() {
        return coCode;
    }

    public void setCoCode(Integer coCode) {
        this.coCode = coCode;
    }

    public Integer getCoLeader() {
        return coLeader;
    }

    public void setCoLeader(Integer coLeader) {
        this.coLeader = coLeader;
    }

    public String getCoState() {
        return coState;
    }

    public void setCoState(String coState) {
        this.coState = coState;
    }

    @Override
    public String toString() {
        return "Company{" +
                "coId=" + coId +
                ", coName='" + coName + '\'' +
                ", coCode=" + coCode +
                ", coLeader=" + coLeader +
                ", coState='" + coState + '\'' +
                '}';
    }
}