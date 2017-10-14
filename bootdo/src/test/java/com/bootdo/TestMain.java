package com.bootdo;

import java.util.Collection;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.MemorySessionDAO;

public class TestMain {

	public static void main(String[] args) {
		MemorySessionDAO sessionDAO = new MemorySessionDAO();
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		System.out.println(sessions.toString());
		for (Session session : sessions) {

			System.out.println("登录ip:" + session.getHost());

			System.out.println("最后操作日期:" + session.getLastAccessTime());
		}

	}
}
