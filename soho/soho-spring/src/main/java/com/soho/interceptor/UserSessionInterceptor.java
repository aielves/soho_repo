package com.soho.interceptor;

import com.soho.shiro.utils.SessionUtils;
import com.soho.web.vo.BaseVO;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.shiro.session.Session;

/**
 * Created by shadow on 2016/3/24.
 */
public class UserSessionInterceptor implements MethodInterceptor {

    @Override
    public Object invoke(MethodInvocation invocation) throws Throwable {
        // System.out.println(invocation.getThis().getClass().getName()+"."+invocation.getMethod().getName());
        Object[] objects = invocation.getArguments();
        if (objects != null && objects.length > 0) {
            Object[] newobjects = new Object[objects.length];
            for (int i = 0; i < objects.length; i++) {
                if (objects[0] instanceof BaseVO<?>) {
                    BaseVO base = (BaseVO) objects[i];
                    Session session = SessionUtils.getSession();
                    if (session != null) {
                        Object user = session.getAttribute(SessionUtils.USER);
                        if (user != null) {
                            base.setUser(user);
                            newobjects[i] = base;
                        } else {
                            newobjects[i] = objects[i];
                        }
                    } else {
                        newobjects[i] = objects[i];
                    }
                } else {
                    newobjects[i] = objects[i];
                }
            }
        }
        return invocation.proceed();
    }

}