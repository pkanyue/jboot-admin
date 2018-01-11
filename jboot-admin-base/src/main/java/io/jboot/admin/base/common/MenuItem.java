package io.jboot.admin.base.common;

import java.util.List;

/**
 * 菜单实体
 *
 * @author Rlax
 *
 */
public class MenuItem {

    /** 菜单标题 */
    private String text;
    /** 菜单图标 */
    private String icon;
    /** 链接 */
    private String href;
    /** id */
    private Long mark;

    private List<MenuItem> subset;

    public MenuItem(String text, String icon, String href, Long mark) {
        this.text = text;
        this.icon = icon;
        this.href = href;
        this.mark = mark;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<MenuItem> getSubset() {
        return subset;
    }

    public void setSubset(List<MenuItem> subset) {
        this.subset = subset;
    }

    public Long getMark() {
        return mark;
    }

    public void setMark(Long mark) {
        this.mark = mark;
    }
}
