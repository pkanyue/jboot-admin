package io.jboot.admin.service.api;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.admin.base.common.RetResult;
import io.jboot.admin.service.entity.model.User;

import java.util.List;

public interface UserService  {

    /**
     * 分页查询系统用户信息
     * @param sysUser
     * @return
     */
    public Page<User> findPage(User sysUser, int pageNumber, int pageSize);

    /**
     * 用户名是否存在
     * @param name
     * @return 存在返回-true，否则返回false
     */
    public boolean hasUser(String name);

    /**
     * 根据用户名查询系统用户信息
     * @param name
     * @return
     */
    public User findByName(String name);

    /**
     * 保存用户，并且保存用户角色关系
     * @param user 用户
     * @param roles 角色id
     * @return
     */
    public boolean saveUser(User user, Long[] roles);

    /**
     * 修改用户，并且保存用户角色关系
     * @param user 用户
     * @param roles 角色id
     * @return
     */
    public boolean updateUser(User user, Long[] roles);

    /**
     * 根据ID查找model
     *
     * @param id
     * @return
     */
    public User findById(Object id);


    /**
     * 根据ID删除model
     *
     * @param id
     * @return
     */
    public boolean deleteById(Object id);

    /**
     * 删除
     *
     * @param model
     * @return
     */
    public boolean delete(User model);


    /**
     * 保存到数据库
     *
     * @param model
     * @return
     */
    public boolean save(User model);

    /**
     * 保存或更新
     *
     * @param model
     * @return
     */
    public boolean saveOrUpdate(User model);

    /**
     * 更新 model
     *
     * @param model
     * @return
     */
    public boolean update(User model);


    public void join(Page<? extends Model> page, String joinOnField);
    public void join(Page<? extends Model> page, String joinOnField, String[] attrs);
    public void join(Page<? extends Model> page, String joinOnField, String joinName);
    public void join(Page<? extends Model> page, String joinOnField, String joinName, String[] attrs);


    public void join(List<? extends Model> models, String joinOnField);
    public void join(List<? extends Model> models, String joinOnField, String[] attrs);
    public void join(List<? extends Model> models, String joinOnField, String joinName);
    public void join(List<? extends Model> models, String joinOnField, String joinName, String[] attrs);

    /**
     * 添加关联数据到某个model中去，避免关联查询，提高性能。
     *
     * @param model       要添加到的model
     * @param joinOnField model对于的关联字段
     */
    public void join(Model model, String joinOnField);

    /**
     * 添加关联数据到某个model中去，避免关联查询，提高性能。
     *
     * @param model
     * @param joinOnField
     * @param attrs
     */
    public void join(Model model, String joinOnField, String[] attrs);


    /**
     * 添加关联数据到某个model中去，避免关联查询，提高性能。
     *
     * @param model
     * @param joinOnField
     * @param joinName
     */
    public void join(Model model, String joinOnField, String joinName);


    /**
     * 添加关联数据到某个model中去，避免关联查询，提高性能。
     *
     * @param model
     * @param joinOnField
     * @param joinName
     * @param attrs
     */
    public void join(Model model, String joinOnField, String joinName, String[] attrs);


    public void keep(Model model, String... attrs);

    public void keep(List<? extends Model> models, String... attrs);
}