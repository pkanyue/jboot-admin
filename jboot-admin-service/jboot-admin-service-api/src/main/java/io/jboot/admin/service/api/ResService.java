package io.jboot.admin.service.api;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.admin.base.common.ZTree;
import io.jboot.admin.service.entity.model.Res;

import java.util.List;

public interface ResService  {

    /**
     * 系统资源查询分页数据
     * @param sysRes 查询条件
     * @return 分页数据
     */
    public Page<Res> findPage(Res sysRes, int pageNumber, int pageSize);

    /**
     * 查询可用Res树
     * @return
     */
    public List<ZTree> findTreeOnUse();

    /**
     * 查询全部资源树
     * @return
     */
    public List<ZTree> findAllTree();

    /**
     * 根据角色ID查询资源树，角色赋权使用
     * @param id
     * @return
     */
    public List<ZTree> findTreeOnUseByRoleId(Long id);

    /**
     * 根据角色ID查询可用资源列表
     * @param id
     * @return
     */
    public List<Res> findByRoleIdAndStatusUsed(Long id);

    /**
     * 根据状态查询资源列表
     * @return
     */
    public List<Res> findByStatus(String status);

    /**
     * 根据用户名查询用户所拥有的资源集
     * @param name
     * @return
     */
    public List<Res> findByUserNameAndStatusUsed(String name);

    /**
     * 查询顶部菜单树资源
     * @param name
     * @return
     */
    public List<Res> findTopMenuByUserName(String name);

    /**
     * 查询左侧菜单树资源
     * @param name 用户名
     * @param pid 顶部菜单id
     * @return
     */
    public List<Res> findLeftMenuByUserNameAndPid(String name, Long pid);

    /**
     * 资源节点是否有子节点
     * @param id 节点id
     * @return
     */
    public boolean hasChildRes(Long id);

    /**
     * 根据ID查找model
     *
     * @param id
     * @return
     */
    public Res findById(Object id);


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
    public boolean delete(Res model);


    /**
     * 保存到数据库
     *
     * @param model
     * @return
     */
    public boolean save(Res model);

    /**
     * 保存或更新
     *
     * @param model
     * @return
     */
    public boolean saveOrUpdate(Res model);

    /**
     * 更新 model
     *
     * @param model
     * @return
     */
    public boolean update(Res model);


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