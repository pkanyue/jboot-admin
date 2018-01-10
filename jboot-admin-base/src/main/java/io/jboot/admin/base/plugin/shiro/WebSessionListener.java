package io.jboot.admin.base.plugin.shiro;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * session 监听
 * @author Rlax
 *
 */
public class WebSessionListener extends SessionListenerAdapter {

	private final static Logger logger = LoggerFactory.getLogger(WebSessionListener.class);

	@Override
	public void onExpiration(Session session) {
		logger.info("onExpiration session {}" + session);
		super.onExpiration(session);
	}

    @Override
    public void onStart(Session session) {
        logger.info("onStart session {}" + session);
        super.onStart(session);
    }

    @Override
    public void onStop(Session session) {
        logger.info("onStop session {}" + session);
        super.onStop(session);
    }
}
