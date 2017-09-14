package com.bootdo.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bootdo.system.domain.MenuDO;

public interface MenuMapper {
	@Select("SELECT  menu_id, parent_id, name, url, perms, `type`, icon, order_num, gmt_create, gmt_modified FROM sys_menu where menu_id =#{id}")
	MenuDO getMenu(Long id);

	@Select("select distinct m.menu_id , parent_id, name, url, perms, `type`, icon, order_num, gmt_create, gmt_modified from sys_menu m left join sys_role_menu rm on m.menu_id = rm.menu_id left join sys_user_role ur on rm.role_id = ur.role_id where ur.user_id = #{id} and m.type in(0,1) order by m.type")
	List<MenuDO> listMenuByUserId(Long id);

	@Select("select m.perms from sys_menu m left join sys_role_menu rm on m.menu_id = rm.menu_id left join sys_user_role ur on rm.role_id = ur.role_id where ur.user_id = #{id} ")
	List<String> listUserPerms(Long id);

	@Select("SELECT menu_id, parent_id, name, url, perms, `type`, icon, order_num, gmt_create, gmt_modified FROM sys_menu order by type")
	List<MenuDO> listMenu();

	@Delete("delete from sys_menu where menu_id = #{id}")
	int remove(Long id);

	@Insert("insert sys_menu(parent_id,name,url,perms,type) values(#{parentId},#{name},#{url},#{perms},#{type})")
	int save(MenuDO menu);

	@Update("UPDATE sys_menu SET  name=#{name}, url=#{url},  icon=#{icon},type=#{type},perms=#{perms} WHERE menu_id=#{menuId}")
	int update(MenuDO menu);
}
