package io.jboot.admin.base.common;

import io.jboot.config.annotation.PropertyConfig;

/**
 * 应用信息
 * @author Rlax
 *
 */
@PropertyConfig(prefix = "jboot.admin.app")
public class AppInfo {

    private String name;
    private String org;
    private String orgWebsite;
    private String resourceHost;
    private String copyRight;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }

    public String getOrgWebsite() {
        return orgWebsite;
    }

    public void setOrgWebsite(String orgWebsite) {
        this.orgWebsite = orgWebsite;
    }

    public String getResourceHost() {
        return resourceHost;
    }

    public void setResourceHost(String resourceHost) {
        this.resourceHost = resourceHost;
    }

    public String getCopyRight() {
        return copyRight;
    }

    public void setCopyRight(String copyRight) {
        this.copyRight = copyRight;
    }

    @Override
    public String toString() {
        return "AppInfo{" +
                "name='" + name + '\'' +
                ", org='" + org + '\'' +
                ", orgWebsite='" + orgWebsite + '\'' +
                ", resourceHost='" + resourceHost + '\'' +
                ", copyRight='" + copyRight + '\'' +
                '}';
    }
}
