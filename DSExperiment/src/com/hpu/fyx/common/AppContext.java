package com.hpu.fyx.common;

import java.util.HashMap;

import com.hpu.fyx.model.User;

public class AppContext {
    private static final ThreadLocal<AppContext> appContext = new ThreadLocal<AppContext>();
    private final HashMap<String, Object> values = new HashMap<String, Object>();
    private static String contextPath;

    public static String getContextPath() {
        return contextPath;
    }

    public static void setContextPath(String contextPath) {
        if (AppContext.contextPath == null) {
            AppContext.contextPath = contextPath;
        }
    }

    public static AppContext getContext() {
        AppContext context = appContext.get();
        if (context == null) {
            context = new AppContext();
            appContext.set(context);
        }
        return context;
    }

    public void clear() {
        AppContext context = appContext.get();
        if (context != null) {
            context.values.clear();
        }
        context = null;
    }

    public void addObject(String key, Object value) {
        values.put(key, value);
    }

    public Object getObject(String key) {
        return values.get(key);
    }

    public void removeObject(String key) {
        values.remove(key);
    }

    public User getUser() {
        return (User)values.get(Constants.APP_CONTEXT_USER);
    }
}
