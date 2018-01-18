package io.jboot.wechat.controller.wechat;

import com.jfinal.weixin.sdk.jfinal.MsgControllerAdapter;
import com.jfinal.weixin.sdk.msg.in.InTextMsg;
import com.jfinal.weixin.sdk.msg.in.event.InFollowEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMenuEvent;
import com.jfinal.weixin.sdk.msg.out.OutTextMsg;
import io.jboot.web.controller.annotation.RequestMapping;

@RequestMapping("/wechat/msg")
public class WeixinMsgController extends MsgControllerAdapter {

    /**
     * 处理接收到的关注/取消关注事件
     */
    @Override
    protected void processInFollowEvent(InFollowEvent inFollowEvent) {
        OutTextMsg outMsg = new OutTextMsg(inFollowEvent);
        outMsg.setContent("欢迎关注！");
        render(outMsg);
    }

    @Override
    protected void processInTextMsg(InTextMsg inTextMsg) {
        renderOutTextMsg("感谢您的关注！小编已经收到您的消息，并将尽快通过微信与您取得联系。");
    }

    @Override
    protected void processInMenuEvent(InMenuEvent inMenuEvent) {

    }

}

