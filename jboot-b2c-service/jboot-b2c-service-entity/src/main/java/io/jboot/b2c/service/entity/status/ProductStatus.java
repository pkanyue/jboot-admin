package io.jboot.b2c.service.entity.status;

import io.jboot.admin.base.common.BaseStatus;

/**
 * 商品状态
 * @author Rlax
 *
 */
public class ProductStatus extends BaseStatus {

    public final static String UNUSED = "0";
    public final static String USED = "1";

    public ProductStatus() {
        add(UNUSED, "停用");
        add(USED, "启用");
    }

    private static ProductStatus me;

    public static ProductStatus me() {
        if (me == null) {
            me = new ProductStatus();
        }
        return me;
    }
}
