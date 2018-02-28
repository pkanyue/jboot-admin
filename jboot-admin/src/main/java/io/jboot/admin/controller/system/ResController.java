package io.jboot.admin.controller.system;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.admin.base.common.MenuItem;
import io.jboot.admin.base.common.RestResult;
import io.jboot.admin.base.exception.BusinessException;
import io.jboot.admin.base.interceptor.NotNullPara;
import io.jboot.admin.base.rest.datatable.DataTable;
import io.jboot.admin.base.web.base.BaseController;
import io.jboot.admin.service.api.ResService;
import io.jboot.admin.service.entity.model.Res;
import io.jboot.admin.service.entity.status.system.ResStatus;
import io.jboot.admin.support.auth.AuthUtils;
import io.jboot.admin.validator.system.ResValidator;
import io.jboot.component.metric.annotation.EnableMetricCounter;
import io.jboot.component.swagger.ParamType;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import java.util.*;


/**
 * 系统资源控制器
 * @author Rlax
 *
 */
@RequestMapping("/system/res")
@Api(description = "资源管理接口文档", basePath = "/system/res", tags = "res")
public class ResController extends BaseController {

    @JbootrpcService
    private ResService resService;

    /**
     * index
     */
    public void index() {
        render("main.html");
    }

    /**
     * add
     */
    @NotNullPara({"pid"})
    public void add() {
        Long pid = getParaToLong("pid");

        Res pRes = new Res();
        if (pid == null || pid == 0) {
            pRes.setId(0L);
            pRes.setName("根节点");
        } else {
            pRes = resService.findById(pid);
        }

        setAttr("pRes", pRes).render("add.html");
    }

    /**
     * 保存提交
     */
    @Before({POST.class, ResValidator.class})
    public void postAdd() {
        Long pid = getParaToLong("pid");
        Res sysRes = getBean(Res.class, "res");

        if (pid != 0) {
            Res pRes = resService.findById(pid);
            if (pRes == null) {
                throw new BusinessException("上级资源不存在");
            } else {
                sysRes.setLevel(pRes.getLevel() + 1);
            }
        } else {
            sysRes.setLevel(1);
        }

        if (StrKit.isBlank(sysRes.getIconCls())) {
            sysRes.setIconCls("");
        }

        sysRes.setPid(pid);
        sysRes.setLastUpdAcct(AuthUtils.getLoginUser().getName());
        sysRes.setStatus(ResStatus.USED);
        sysRes.setLastUpdTime(new Date());
        sysRes.setNote("保存系统资源");

        if (!resService.save(sysRes)) {
            throw new BusinessException("保存失败，请重试");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * update
     */
    @NotNullPara({"id"})
    public void update() {
        Long id = getParaToLong("id");

        Res sysRes = resService.findById(id);
        Res pRes = new Res();
        if (sysRes.getPid() == null || sysRes.getPid() == 0) {
            pRes.setId(0L);
            pRes.setName("根节点");
        } else {
            pRes = resService.findById(sysRes.getPid());
        }

        setAttr("pRes", pRes).setAttr("res", sysRes).render("update.html");
    }

    /**
     * 修改提交
     */
    @Before({POST.class, ResValidator.class})
    public void postUpdate() {
        Long pid = getParaToLong("pid");
        Res sysRes = getBean(Res.class, "res");

        if (StrKit.isBlank(sysRes.getIconCls())) {
            sysRes.setIconCls("");
        }

        sysRes.setPid(pid);
        sysRes.setLastUpdAcct(AuthUtils.getLoginUser().getName());
        sysRes.setLastUpdTime(new Date());
        sysRes.setNote("修改系统资源");

        if (!resService.update(sysRes)) {
            throw new BusinessException("修改失败，请重试");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 删除
     */
    @NotNullPara({"id"})
    public void delete() {
        Long id = getParaToLong("id");

        if (resService.hasChildRes(id)) {
            throw new BusinessException("系统资源存在下级资源节点，不可删除");
        }

        if (!resService.deleteById(id)) {
            throw new BusinessException("删除失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 启用资源
     */
    @NotNullPara({"id"})
    public void use() {
        Long id = getParaToLong("id");

        Res sysRes = resService.findById(id);
        if (sysRes == null) {
            throw new BusinessException("编号为" + id + "的资源不存在");
        }
        sysRes.setStatus(ResStatus.USED);
        sysRes.setLastUpdTime(new Date());
        sysRes.setNote("启用系统资源");

        if (!resService.update(sysRes)) {
            throw new BusinessException("启用失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 停用资源
     */
    @NotNullPara({"id"})
    public void unuse() {
        Long id = getParaToLong("id");

        Res sysRes = resService.findById(id);
        if (sysRes == null) {
            throw new BusinessException("编号为" + id + "的资源不存在");
        }

        sysRes.setStatus(ResStatus.UNUSED);
        sysRes.setLastUpdTime(new Date());
        sysRes.setNote("停用系统资源");

        if (!resService.update(sysRes)) {
            throw new BusinessException("停用失败");
        }

        renderJson(RestResult.buildSuccess());
    }

    /**
     * 系统资源资源树
     */
    public void resTree() {
        renderJson(RestResult.buildSuccess(resService.findTreeOnUse()));
    }

    /**
     * 系统资源资源树
     */
    @NotNullPara({"id"})
    public void resAuthTree() {
        renderJson(RestResult.buildSuccess(resService.findTreeOnUseByRoleId(getParaToLong("id"))));
    }

    /**
     * res表格数据
     */
    @ApiOperation(value = "表格数据", httpMethod = "GET", notes = "resData")
    public void resData() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 30);

        Res sysRes = new Res();
        sysRes.setPid(getParaToLong("pid", 0L));
        sysRes.setName(getPara("name"));
        sysRes.setUrl(getPara("url"));

        Page<Res> resPage = resService.findPage(sysRes, pageNumber, pageSize);
        renderJson(new DataTable<Res>(resPage));
    }

    /**
     * 系统顶部菜单
     */
    @ApiOperation(value = "顶部菜单", httpMethod = "GET", notes = "menuTop")
    public void menuTop() {
        List<Res> list = resService.findTopMenuByUserName(AuthUtils.getLoginUser().getName());

        List<MenuItem> listL1 = null;
        for (Res l1 : list) {
            if (listL1 == null) {
                listL1 = new LinkedList<MenuItem>();
            }
            MenuItem l1Item = new MenuItem(l1.getName(), l1.getIconCls(), l1.getUrl(), l1.getId());
            listL1.add(l1Item);
        }

        Map<String, List<MenuItem>> menu = new HashMap<String, List<MenuItem>>();
        menu.put("data", listL1);

        renderJson(menu);
    }

    /**
     * 系统左侧菜单
     */
    @NotNullPara({"pid"})
    public void menuLeft() {
        Long pid = getParaToLong("pid");
        List<Res> list = resService.findLeftMenuByUserNameAndPid(AuthUtils.getLoginUser().getName(), pid);

        List<MenuItem> listL1 = null;
        for (Res l1 : list) {
            if (l1.getLevel() == 2) {
                if (listL1 == null) {
                    listL1 = new LinkedList<MenuItem>();
                }
                MenuItem l1Item = new MenuItem(l1.getName(), l1.getIconCls(), l1.getUrl(), l1.getId());
                List<MenuItem> subset = null;
                for (Res l2 : list) {
                    if (l2.getLevel() == 3 && l2.getPid().equals(l1.getId())) {
                        if (subset == null) {
                            subset = new LinkedList<MenuItem>();
                        }
                        MenuItem l2Item = new MenuItem(l2.getName(), l2.getIconCls(), l2.getUrl(), l2.getId());
                        subset.add(l2Item);
                    }
                }
                l1Item.setSubset(subset);
                listL1.add(l1Item);
            }
        }

        Map<String, List<MenuItem>> menu = new HashMap<String, List<MenuItem>>();
        menu.put("data", listL1);

        renderJson(menu);
    }

}
