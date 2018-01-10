package io.jboot.admin.base.plugin.shiro;

import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;

/***
 * 集成会话管理
 * 
 * @author Rlax
 * 
 */
public class SessionDAO extends EnterpriseCacheSessionDAO {

	private static final Logger logger = LoggerFactory.getLogger(SessionDAO.class);
	
	public static SessionDAO me;

	@Override
	public void setCacheManager(CacheManager cacheManager) {
		super.setCacheManager(cacheManager);
		me = this;
	}

	@Override
	protected Serializable doCreate(Session session) {
		Serializable id = super.doCreate(session);
		return id;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
        return super.doReadSession(sessionId);
	}

	@Override
	protected void doUpdate(Session session) {
		super.doUpdate(session);
	}

	@Override
	protected void doDelete(Session session) {
		super.doDelete(session);
	}

}
