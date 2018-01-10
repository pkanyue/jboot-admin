package io.jboot.admin.base.gencode.service;


import io.jboot.config.annotation.PropertyConfig;

/**
 * api代码生成配置
 * @author Rlax
 *
 */
@PropertyConfig(prefix="jboot.admin.service.ge")
public class AppServiceGeneratorConfig {

    /** entity 包名 */
    private String modelpackage;
    /** service 包名 */
    private String servicepackage;
    /** 移除的表前缀 */
    private String removedtablenameprefixes;
    /** 不包含表 */
    private String excludedtable;
    /** 不包含表前缀 */
    private String excludedtableprefixes;

    public String getModelpackage() {
        return modelpackage;
    }

    public void setModelpackage(String modelpackage) {
        this.modelpackage = modelpackage;
    }

    public String getServicepackage() {
        return servicepackage;
    }

    public void setServicepackage(String servicepackage) {
        this.servicepackage = servicepackage;
    }

    public String getRemovedtablenameprefixes() {
        return removedtablenameprefixes;
    }

    public void setRemovedtablenameprefixes(String removedtablenameprefixes) {
        this.removedtablenameprefixes = removedtablenameprefixes;
    }

    public String getExcludedtable() {
        return excludedtable;
    }

    public void setExcludedtable(String excludedtable) {
        this.excludedtable = excludedtable;
    }

    public String getExcludedtableprefixes() {
        return excludedtableprefixes;
    }

    public void setExcludedtableprefixes(String excludedtableprefixes) {
        this.excludedtableprefixes = excludedtableprefixes;
    }

    @Override
    public String toString() {
        return "AppServiceGeneratorConfig{" +
                "modelpackage='" + modelpackage + '\'' +
                ", servicepackage='" + servicepackage + '\'' +
                ", removedtablenameprefixes='" + removedtablenameprefixes + '\'' +
                ", excludedtable='" + excludedtable + '\'' +
                ", excludedtableprefixes='" + excludedtableprefixes + '\'' +
                '}';
    }
}
