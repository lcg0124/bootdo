package com.bootdo.system.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bootdo.system.domain.UserDO;
import com.bootdo.system.domain.UserOnline;
import com.bootdo.system.service.SessionService;

/**
 * 待完善
 * @author bootdo
 *
 */
@Service
public class SessionServiceImpl implements SessionService {
	@Autowired
	private SessionDAO sessionDAO;

	@Override
	public List<UserOnline> list() {
		List<UserOnline> list = new ArrayList<>();
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		for (Session session : sessions) {
			UserOnline userOnline = new UserOnline();
			UserDO userDO = new UserDO();
			SimplePrincipalCollection principalCollection = new SimplePrincipalCollection();
			if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
				System.out.println("PRINCIPALS_SESSION_KEY" + "----------空");
				continue;
			} else {
				principalCollection = (SimplePrincipalCollection) session
						.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
			}
			if (principalCollection == null) {
				System.out.println("principalCollection" + "----------空");
			} else {
				userDO = (UserDO) principalCollection.getPrimaryPrincipal();
			}
			if (userDO == null) {
				System.out.println("userDO" + "----------空");
			} else {
				userOnline.setUsername(userDO.getUsername());
			}

			if (session.getId() == null) {
				System.out.println("userDO" + "----------空");
				continue;
			}
			userOnline.setId((String) session.getId());
			userOnline.setHost(session.getHost());
			userOnline.setStartTimestamp(session.getStartTimestamp());
			userOnline.setLastAccessTime(session.getStartTimestamp());
			userOnline.setTimeout(session.getTimeout());
			list.add(userOnline);
		}
		return list;
	}

}
