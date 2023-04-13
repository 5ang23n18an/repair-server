package com.wqtang.api.system;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.system.SystemMenu;
import com.wqtang.object.vo.TreeInfo;
import com.wqtang.object.vo.TreeListInfo;
import com.wqtang.system.SystemMenuService;
import com.wqtang.util.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
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

    @Resource(name = "systemMenuService")
    private SystemMenuService systemMenuService;

    @GetMapping("/list")
    public List<SystemMenu> getList(SystemMenu request) {
        return systemMenuService.listByParams(request, SecurityUtils.getCurrentUserId());
    }

    @GetMapping("/{menuId}")
    public SystemMenu getById(@PathVariable("menuId") Long menuId) {
        return systemMenuService.getByMenuId(menuId);
    }

    @GetMapping("/tree/{roleId}")
    public TreeListInfo menuTreeListInfo(@PathVariable("roleId") Long roleId) {
        List<Long> menuIds = systemMenuService.listMenuIdsByRoleId(roleId);
        List<SystemMenu> menuList = systemMenuService.listByUserId(SecurityUtils.getCurrentUserId());
        systemMenuService.refactorAsTree(menuList);
        List<TreeInfo> treeInfo = menuList.stream().map(TreeInfo::new).collect(Collectors.toList());
        TreeListInfo treeListInfo = new TreeListInfo();
        treeListInfo.setKeys(menuIds);
        treeListInfo.setInfo(treeInfo);
        return treeListInfo;
    }

    @GetMapping("/tree")
    public List<TreeInfo> getTree(SystemMenu request) {
        List<SystemMenu> menuList = systemMenuService.listByParams(request, SecurityUtils.getCurrentUserId());
        systemMenuService.refactorAsTree(menuList);
        return menuList.stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    @PostMapping("/add")
    public void add(@RequestBody SystemMenu request) {
        if (systemMenuService.isMenuNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该菜单名称已经存在");
        }
        if (UserConstants.YES_FRAME.equals(request.getIsFrame())
                && !StringUtils.startsWithAny(request.getPath(), "http://", "https://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "外链菜单必须是有效的链接地址(以\"http(s)://\"开头)");
        }
        request.setCreateBy(SecurityUtils.getCurrentUsername());
        systemMenuService.insert(request);
    }

    @PutMapping("/edit")
    public void edit(@RequestBody SystemMenu request) {
        if (systemMenuService.isMenuNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该菜单名称已经存在");
        }
        if (UserConstants.YES_FRAME.equals(request.getIsFrame())
                && !StringUtils.startsWithAny(request.getPath(), "http://", "https://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "外链菜单必须是有效的链接地址(以\"http(s)://\"开头)");
        }
        if (request.getMenuId().equals(request.getParentId())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "上级菜单不能是自己");
        }
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        systemMenuService.update(request);
    }

    @DeleteMapping("/{menuId}")
    public void delete(@PathVariable("menuId") Long menuId) {
        if (systemMenuService.existsChildrenMenuByMenuId(menuId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前菜单仍存在子菜单, 不允许删除");
        }
        if (systemMenuService.existsRoleByMenuId(menuId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前菜单已被分配, 不允许删除");
        }
        systemMenuService.deleteByMenuId(menuId);
    }

}
