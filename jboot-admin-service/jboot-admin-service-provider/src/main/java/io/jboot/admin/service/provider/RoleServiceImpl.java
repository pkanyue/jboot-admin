package io.jboot.admin.service.provider;

import io.jboot.aop.annotation.Bean;
import io.jboot.admin.service.api.RoleService;
import io.jboot.admin.service.entity.model.Role;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;

@Bean
@Singleton
@JbootrpcService
public class RoleServiceImpl extends JbootServiceBase<Role> implements RoleService {

}