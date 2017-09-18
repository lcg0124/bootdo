package com.bootdo.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bootdo.system.domain.RoleMenuDO;
import com.bootdo.system.domain.UserRoleDO;

public interface UserRoleMapper {
	@Insert("INSERT INTO sys_user_role(id, user_id, role_id)" + "VALUES(#{id}, #{userId}, #{roleId})")
	int save(UserRoleDO ur);
	
	@Insert("<script>" + 
			"INSERT INTO sys_user_role(user_id, role_id) values"+
			" <foreach collection=\"list\" item=\"item\" index=\"index\" separator=\",\" >  " + 
			" (#{item.userId},#{item.roleId})" + 
			" </foreach>"+ 
			"</script>")
	int batchSave(List<UserRoleDO> list);

	@Delete("DELETE FROM  sys_user_role WHERE id=#{id}")
	int remove(Long id);

	@Delete("DELETE FROM  sys_user_role WHERE user_id=#{id}")
	int removeByUserId(Long id);

	@Delete("<script>" + "delete from sys_user_role where user_id in"
			+ " <foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"
			+ "</script>")
	int batchRemoveByUserId(List<Long> list);

	@Select("select role_id from sys_user_role where user_id=#{userId}")
	List<Long> listRoleId(Long userId);
	
	
}
