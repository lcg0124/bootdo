package com.bootdo.system.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bootdo.system.dao.RoleMapper;
import com.bootdo.system.dao.RoleMenuMapper;
import com.bootdo.system.dao.UserMapper;
import com.bootdo.system.dao.UserRoleMapper;
import com.bootdo.system.domain.RoleDO;
import com.bootdo.system.domain.RoleMenuDO;
import com.bootdo.system.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	RoleMenuMapper roleMenuMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	UserRoleMapper userRoleMapper;

	@Override
	public List<RoleDO> list() {
		List<RoleDO> roles = roleMapper.listRole();
		return roles;
	}

	@Override
	public List<RoleDO> list(Long userId) {
		List<Long> rolesIds = userRoleMapper.listRoleId(userId);
		List<RoleDO> roles = roleMapper.listRole();
		for (RoleDO roleDO : roles) {
			roleDO.setRoleSign("false");
			for (Long roleId : rolesIds) {
				if (roleDO.getRoleId() == roleId) {
					roleDO.setRoleSign("true");
					break;
				}
			}
		}
		return roles;
	}

	@Transactional
	@Override
	public int save(RoleDO role) {
		roleMapper.save(role);
		List<Long> menuIds = role.getMenuIds();
		Long roleId = role.getRoleId();
		roleMenuMapper.removeByRoleId(roleId);
		int count=0; ///= roleMenuMapper.batchSave(roleId, menuIds);
		for (Long menuId : menuIds) {
			RoleMenuDO roleMenuDO = new RoleMenuDO();
			roleMenuDO.setMenuId(menuId);
			roleMenuDO.setRoleId(roleId);
			count = roleMenuMapper.save(roleMenuDO);
		}
		return count;
	}

	@Transactional
	@Override
	public int remove(Long id) {
		int count = roleMapper.remove(id);
		roleMenuMapper.remove(id);
		return count;
	}

	@Override
	public RoleDO get(Long id) {
		RoleDO roleDO = roleMapper.get(id);
		return roleDO;
	}

	@Override
	public int update(RoleDO role) {
		roleMapper.update(role);
		int r = 0;
		List<Long> menuIds = role.getMenuIds();
		Long roleId = role.getRoleId();
		roleMenuMapper.removeByRoleId(roleId);
		for (Long menuId : menuIds) {
			RoleMenuDO roleMenuDO = new RoleMenuDO();
			roleMenuDO.setMenuId(menuId);
			roleMenuDO.setRoleId(roleId);
			r = roleMenuMapper.save(roleMenuDO);
		}
		return r;
	}

}
