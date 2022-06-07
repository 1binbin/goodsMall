package com.controller.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 统计在线人数
 * @Author hongxiaobin
 * @Time 2022/6/7-14:28
 */
public class SessionCounter implements HttpSessionListener {
    private static int activeSession = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
       activeSession++;
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if (activeSession>0){
            activeSession--;
        }
    }
    public static int getActiveSession(){
        return activeSession;
    }
}
