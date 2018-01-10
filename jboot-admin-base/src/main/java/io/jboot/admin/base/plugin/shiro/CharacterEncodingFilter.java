package io.jboot.admin.base.plugin.shiro;

import com.jfinal.core.Const;
import org.apache.shiro.web.servlet.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;


/**
 * shiro 编码过滤器
 * @author Rlax
 *
 */
public class CharacterEncodingFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding(Const.DEFAULT_ENCODING);
        chain.doFilter(request, response);
    }
}
