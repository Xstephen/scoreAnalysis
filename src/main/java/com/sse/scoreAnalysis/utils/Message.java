package com.sse.scoreAnalysis.utils;

import java.util.HashMap;
import java.util.Map;

public class Message {
    //状态码 100成功 200 失败
    private int code;
    //返回信息
    private String msg;
    //返回的内容
    private Map<String,Object> content=new HashMap<String, Object>();

    public Message(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static Message success(){
        return new Message(100,"执行成功");
    }
    public static Message fail(String msg){
        return new Message(200,msg);
    }
    public Message add(String key,Object value){
        this.getContent().put(key,value);
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

    public Map<String, Object> getContent() {
        return content;
    }

    public void setContent(Map<String, Object> content) {
        this.content = content;
    }
}
