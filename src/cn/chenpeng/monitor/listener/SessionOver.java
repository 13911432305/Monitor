package cn.chenpeng.monitor.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cn.chenpeng.monitor.domain.User;
@WebListener
public class SessionOver implements HttpSessionListener {

    public SessionOver() {
    }

    public void sessionCreated(HttpSessionEvent arg0) { 
    	HttpSession session = arg0.getSession();
    	session.setMaxInactiveInterval(30*60);
    }

    public void sessionDestroyed(HttpSessionEvent arg0) { 
    	HttpSession session = arg0.getSession();
    	User user = (User)session.getAttribute("currentuser");
    	
    	if(user!=null) {
    		session.getServletContext().removeAttribute(user.getUsername());
    	}
    	
    	
    	
    }
	
}
