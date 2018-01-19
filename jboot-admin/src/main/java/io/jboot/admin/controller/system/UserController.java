package io.jboot.admin.controller.system;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.admin.base.common.RestResult;
import io.jboot.admin.base.exception.BusinessException;
import io.jboot.admin.base.interceptor.NotNullPara;
import io.jboot.admin.base.rest.datatable.DataTable;
import io.jboot.admin.base.web.base.BaseController;
import io.jboot.admin.service.api.RoleService;
import io.jboot.admin.service.api.UserService;
import io.jboot.admin.service.entity.model.Role;
import io.jboot.admin.service.entity.model.User;
import io.jboot.admin.service.entity.status.system.UserStatus;
import io.jboot.admin.support.auth.AuthUtils;
import io.jboot.admin.validator.system.ChangePwdValidator;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

import java.util.Date;
import java.util.List;

/**
 * 系统用户管理
 * @author Rlax
 * 
 */
@RequestMapping("/system/user")
public class UserController extends BaseController {

    @JbootrpcService
    private UserService userService;

    @JbootrpcService
    private RoleService roleService;

    /**
     * index
     */
    public void index() {
        render("main.html");
    }

    /**
     * res表格数据
     */
    public void tableData() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 30);

        User sysUser = new User();
        sysUser.setName(getPara("name"));
        sysUser.setPhone(getPara("phone"));

        Page<User> userPage = userService.findPage(sysUser, pageNumber, pageSize);
        renderJson(new DataTable<User>(userPage));
    }

    /**
     * add
     */
    public void add() {
        List<Role> roleList = roleService.findByStatusUsed();
        setAttr("roleList", roleList).render("add.html");
    }

    /**
     * 保存提交
     */
    public void postAdd() {
        User sysUser = getBean(User.class, "user");
        Long[] roles = getParaValuesToLong("userRole");

        if (userService.hasUser(sysUser.getName())) {
            throw new BusinessException("用户名已经存在");
        }

        sysUser.setLastUpdAcct(AuthUtils.getLoginUser().getName());
        if (!userService.saveUser(sysUser, roles)) {
            throw new BusinessException("保存失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * update
     */
    @NotNullPara({"id"})
    public void update() {
        Long id = getParaToLong("id");
        User sysUser = userService.findById(id);

        List<Role> roleList = roleService.findByStatusUsed();
        List<Role> sysRoleList = roleService.findByUserName(sysUser.getName());

        setAttr("user", sysUser).setAttr("roleList", roleList).setAttr("userRoleList", sysRoleList).render("update.html");
    }

    /**
     * 修改提交
     */
    public void postUpdate() {
        User sysUser = getBean(User.class, "user");
        Long[] roles = getParaValuesToLong("userRole");

        User _sysUser = userService.findById(sysUser.getId());
        if (_sysUser == null) {
            throw new BusinessException("用户不存在");
        }

        sysUser.setLastUpdAcct(AuthUtils.getLoginUser().getName());

        if (!userService.updateUser(sysUser, roles)) {
            throw new BusinessException("修改失败");
        }
        renderJson(RestResult.buildSuccess());
    }

    /**
     * 删除
     */
    @NotNullPara({"id"})
    public void delete() {
        Long id = getParaToLong("id");
        if (!userService.deleteById(id)) {
            throw new BusinessException("删除失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 解锁用户
     */
    @NotNullPara({"id"})
    public void use() {
        Long id = getParaToLong("id");

        User sysUser = userService.findById(id);
        if (sysUser == null) {
            throw new BusinessException("用户不存在");
        }

        sysUser.setStatus(UserStatus.USED);
        sysUser.setLastUpdTime(new Date());
        sysUser.setNote("解锁系统用户");

        if (!userService.update(sysUser)) {
            throw new BusinessException("解锁失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 锁定用户
     */
    @NotNullPara({"id"})
    public void unuse() {
        Long id = getParaToLong("id");

        User sysUser = userService.findById(id);
        if (sysUser == null) {
            throw new BusinessException("用户不存在");
        }

        sysUser.setStatus(UserStatus.LOCKED);
        sysUser.setLastUpdTime(new Date());
        sysUser.setNote("锁定系统用户");

        if (!userService.update(sysUser)) {
            throw new BusinessException("锁定失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 个人资料
     */
    public void profile() {
        User sysUser = userService.findById(AuthUtils.getLoginUser().getId());
        setAttr("user", sysUser).render("profile.html");
    }

    /**
     * 个人资料修改提交
     */
    public void postProfile() {
        User sysUser = getBean(User.class, "user");
        if (!sysUser.getId().equals(AuthUtils.getLoginUser().getId())) {
            throw new BusinessException("无权操作");
        }

        sysUser.setLastUpdAcct(AuthUtils.getLoginUser().getName());
        sysUser.setLastUpdTime(new Date());
        sysUser.setNote("用户修改个人资料");

        if (!userService.update(sysUser)) {
            throw new BusinessException("资料修改失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 修改密码
     */
    public void changepwd() {
        User sysUser = AuthUtils.getLoginUser();
        setAttr("user", sysUser).render("changepwd.html");
    }

    /**
     * 修改密码提交
     */
    @Before( {POST.class, ChangePwdValidator.class} )
    public void postChangepwd() {
        User sysUser = getBean(User.class, "user");
        if (!sysUser.getId().equals(AuthUtils.getLoginUser().getId())) {
            throw new BusinessException("无权操作");
        }

        String pwd = getPara("newPwd");


        String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
        SimpleHash hash = new SimpleHash("md5", pwd, salt2, 2);
        pwd = hash.toHex();
        sysUser.setPwd(pwd);
        sysUser.setSalt2(salt2);
        sysUser.setLastUpdAcct(AuthUtils.getLoginUser().getName());
        sysUser.setLastUpdTime(new Date());
        sysUser.setNote("用户修改密码");

        if (!userService.update(sysUser)) {
            throw new BusinessException("修改密码失败");
        }

        renderJson(RestResult.buildSuccess());
    }

}
