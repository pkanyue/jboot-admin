package io.jboot.admin.base.gencode.serviceimpl;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.generator.TableMeta;
import io.jboot.Jboot;
import io.jboot.admin.base.gencode.model.AppMetaBuilder;
import io.jboot.codegen.CodeGenHelpler;
import io.jboot.codegen.service.JbootServiceImplGenerator;
import io.jboot.codegen.service.JbootServiceInterfaceGenerator;

import javax.sql.DataSource;
import java.util.List;

/**
 * service 生成
 * @author Rlax
 *
 */
public class AppServiceImplGenerator {

    public static void doGenerate() {
        AppServiceImplGeneratorConfig config = Jboot.config(AppServiceImplGeneratorConfig.class);

        System.out.println(config.toString());

        if (StrKit.isBlank(config.getModelpackage())) {
            System.err.println("jboot.admin.serviceimpl.ge.modelpackage 不可为空");
            System.exit(0);
        }

        if (StrKit.isBlank(config.getServicepackage())) {
            System.err.println("jboot.admin.serviceimpl.ge.servicepackage 不可为空");
            System.exit(0);
        }

        if (StrKit.isBlank(config.getServiceimplpackage())) {
            System.err.println("jboot.admin.serviceimpl.ge.serviceimplpackage 不可为空");
            System.exit(0);
        }

        String modelPackage = config.getModelpackage();
        String servicepackage = config.getServicepackage();
        String serviceimplpackage = config.getServiceimplpackage();

        System.out.println("start generate...");
        System.out.println("generate dir:" + servicepackage);

        DataSource dataSource = CodeGenHelpler.getDatasource();

        AppMetaBuilder metaBuilder = new AppMetaBuilder(dataSource);

        if (StrKit.notBlank(config.getRemovedtablenameprefixes())) {
            metaBuilder.setRemovedTableNamePrefixes(config.getRemovedtablenameprefixes().split(","));
        }

        if (StrKit.notBlank(config.getExcludedtableprefixes())) {
            metaBuilder.setSkipPre(config.getExcludedtableprefixes().split(","));
        }

        List<TableMeta> tableMetaList = metaBuilder.build();
        CodeGenHelpler.excludeTables(tableMetaList, config.getExcludedtable());

        new AppJbootServiceImplGenerator(servicepackage , modelPackage, serviceimplpackage).generate(tableMetaList);

        System.out.println("service generate finished !!!");

    }
}
