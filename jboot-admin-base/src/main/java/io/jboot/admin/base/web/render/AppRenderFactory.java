package io.jboot.admin.base.web.render;

import com.jfinal.render.ErrorRender;
import com.jfinal.render.Render;
import io.jboot.web.render.JbootRenderFactory;

/**
 * RenderFactory，覆盖jboot error render
 * @author Rlax
 *
 */
public class AppRenderFactory extends JbootRenderFactory {

    @Override
    public Render getRender(String view) {
        return super.getRender(view);
    }

    @Override
    public Render getErrorRender(int errorCode) {
        return new ErrorRender(errorCode, constants.getErrorView(errorCode));
    }

}
