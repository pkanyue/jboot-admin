package io.jboot.b2c.service.provider;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.aop.annotation.Bean;
import io.jboot.b2c.service.api.ProductService;
import io.jboot.b2c.service.entity.model.Product;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class ProductServiceImpl extends JbootServiceBase<Product> implements ProductService {

    @Override
    public Page<Product> findPage(Product product, int pageNumber, int pageSize) {
        Columns columns = Columns.create();

        if (StrKit.notBlank(product.getName())) {
            columns.like("name", "%"+product.getName()+"%");
        }
        return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "id desc");
    }
}