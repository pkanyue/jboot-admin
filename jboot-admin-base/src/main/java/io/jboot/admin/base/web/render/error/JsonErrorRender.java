package io.jboot.admin.base.web.render.error;

import com.jfinal.render.RenderException;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Json异常Render
 * @author Rlax
 *
 */
public class JsonErrorRender extends BaseErrorRender {

    public JsonErrorRender(int errorCode, String errorMessage) {
        super(errorCode, errorMessage);
    }

    @Override
    public void render() {
        response.setStatus(getErrorCode());

        PrintWriter writer = null;
        try {
            response.setContentType("");
            writer = response.getWriter();
            writer.write("");
            writer.flush();
        } catch (IOException e) {
            throw new RenderException(e);
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }
}
