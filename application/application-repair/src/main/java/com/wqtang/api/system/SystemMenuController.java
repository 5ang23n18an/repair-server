package com.wqtang.api.system;

import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemMenu;
import com.wqtang.object.vo.TreeInfo;
import com.wqtang.object.vo.TreeListInfo;
import com.wqtang.system.SystemMenuService;
import com.wqtang.util.JsonUtils;
import com.wqtang.util.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@RestController
@RequestMapping("/system/menu")
public class SystemMenuController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemMenuController.class);

    @Resource(name = "systemMenuService")
    private SystemMenuService menuService;

    /**
     * 获取菜单列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<SystemMenu> getList(SystemMenu request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return menuService.listByParamsAndUserId(request, SecurityUtils.getCurrentUserId());
    }

    /**
     * 根据菜单编号获取详细信息
     *
     * @param menuId
     * @return
     */
    @GetMapping
    public SystemMenu getInfo(@RequestParam(required = false, value = "menuId") Long menuId) {
        return menuId == null ? null : menuService.getByMenuId(menuId);
    }

    /**
     * 加载对应角色菜单列表树
     *
     * @param roleId
     * @return
     */
    @GetMapping("/roleMenuTree/{roleId}")
    public TreeListInfo roleMenuTree(@PathVariable("roleId") Long roleId) {
        List<Long> menuIds = menuService.listMenuIdsByRoleId(roleId);
        List<SystemMenu> menuList = menuService.listByUserId(SecurityUtils.getCurrentUserId());
        List<SystemMenu> treeNodeList = menuService.buildMenuTree(menuList);
        List<TreeInfo> treeInfo = treeNodeList.stream().map(TreeInfo::new).collect(Collectors.toList());
        TreeListInfo treeListInfo = new TreeListInfo();
        treeListInfo.setKeys(menuIds);
        treeListInfo.setInfo(treeInfo);
        return treeListInfo;
    }

    /**
     * 获取菜单下拉树列表
     *
     * @param request
     * @return
     */
    @GetMapping("/tree")
    public List<TreeInfo> getTree(SystemMenu request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        List<SystemMenu> menuList = menuService.listByParamsAndUserId(request, SecurityUtils.getCurrentUserId());
        List<SystemMenu> treeNodeList = menuService.buildMenuTree(menuList);
        return treeNodeList.stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    /**
     * 新增菜单
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "菜单管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemMenu request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        menuService.insert(request);
    }

    /**
     * 修改菜单
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "菜单管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemMenu request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        menuService.update(request);
    }

    private void checkAddEditRequest(SystemMenu request) {
        if (menuService.isMenuNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该菜单名称已经存在");
        }
        if (UserConstants.YES_FRAME.equals(request.getIsFrame())
                && !StringUtils.startsWithAny(request.getPath(), "http://", "https://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "外链菜单必须是有效的链接地址(以\"http(s)://\"开头)");
        }
        if (request.getMenuId().equals(request.getParentId())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "上级菜单不能是自己");
        }
    }

    /**
     * 删除菜单
     *
     * @param menuId
     */
    @DeleteMapping
    @OperationLog(title = "菜单管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "menuId") Long menuId) {
        if (menuService.existsChildrenMenuByMenuId(menuId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前菜单仍存在子菜单, 不允许删除");
        }
        if (menuService.existsRoleByMenuId(menuId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前菜单已被分配, 不允许删除");
        }
        menuService.deleteByMenuId(menuId);
    }

}
