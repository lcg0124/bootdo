package com.bootdo.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bootdo.system.domain.SysUserDO;

public interface UserMapper {
//	@Select("select user_id, username,name, password, email, mobile, status, user_id_create, gmt_create, gmt_modified "
//			+ "from sys_user where username=#{username}")
//	List<SysUser> listUserByUserame(String username);
//
//	@Select("select user_id, username,name, password, email, mobile, status, user_id_create, gmt_create, gmt_modified "
//			+ "from sys_user")
//	List<SysUser> list_bak();
//
//	@Update("update sys_user set username=#{username},name=#{name},email=#{email},status=#{status} where user_id=#{userId}")
//	int update_bak(SysUser user);
//
//	@Options(useGeneratedKeys = true, keyProperty = "userId")
//	@Insert("insert sys_user(username,name,password,email,status) values (#{username},#{name},#{password},#{email},#{status})")
//	int save_bak(SysUser user);
//
//	@Delete("delete from sys_user where user_id = #{id}")
//	int remove_bak(Long id);
//
//	@Select("select user_id, username,name, password, email, mobile, status, user_id_create, gmt_create, gmt_modified "
//			+ "from sys_user where user_id=#{id}")
//	SysUser get_bak(Long id);
//
//	@Update("update sys_user set password = #{password} where user_id=#{userId}")
//	int resetPwd(SysUser user);
//
//	@Delete("<script>" + 
//				"delete from sys_user where user_id in"+ 
//				"<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach> "+ 
//			"</script>")
//	int batchRemove_bak(List<Long> list);
//	//
//	@Select("select `user_id`, `username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name` from sys_user where user_id = #{id}")
//	SysUser get(Long id);
//	@Select("<script>" +
//	"select * from sys_user " + 
//			"<where>" + 
//				"<if test=\"name != null\">"+ 
//				"and name like concat('%', #{name}, '%')  " + 
//				"</if>" + 
//			"</where>"+ 
//			"<if test=\"offset != null and limit != null\">"+
//			"limit #{offset}, #{limit}" + 
//			"</if>"+
//			"</script>")
//	List<SysUser> list(Map<String,Object> map);
//	@Select("<script>" +
//			"select  count(*) from sys_user " + 
//			"<where>" + 
//				"<if test=\"name != null\">"+ 
//				"and name like concat('%', #{name}, '%')  " + 
//				"</if>" + 
//			"</where>"+ 
//			"</script>")
//	int count(Map<String,Object> map);
//	@Options(useGeneratedKeys = true, keyProperty = "userId")
//	@Insert("insert into sys_user (`username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name`)"
//	+ "values (#{username}, #{password}, #{email}, #{mobile}, #{status}, #{userIdCreate}, #{gmtCreate}, #{gmtModified}, #{name})")
//	int save(SysUser obj);
//	@Update("<script>"+ 
//			"update sys_user " + 
//					"<set>" + 
//		            "<if test=\"userId != null\">`user_id` = #{userId}, </if>" + 
//                    "<if test=\"username != null\">`username` = #{username}, </if>" + 
//                    "<if test=\"password != null\">`password` = #{password}, </if>" + 
//                    "<if test=\"email != null\">`email` = #{email}, </if>" + 
//                    "<if test=\"mobile != null\">`mobile` = #{mobile}, </if>" + 
//                    "<if test=\"status != null\">`status` = #{status}, </if>" + 
//                    "<if test=\"userIdCreate != null\">`user_id_create` = #{userIdCreate}, </if>" + 
//                    "<if test=\"gmtCreate != null\">`gmt_create` = #{gmtCreate}, </if>" + 
//                    "<if test=\"gmtModified != null\">`gmt_modified` = #{gmtModified}, </if>" + 
//                    "<if test=\"name != null\">`name` = #{name}, </if>" + 
//          			"</set>" + 
//					"where user_id = #{userId}"+
//			"</script>")
//	int update(SysUser obj);
//	@Delete("delete from sys_user where user_id =#{userId}")
//	int remove(Long user_id);
//	
//	@Delete("<script>"+ 
//			"delete from sys_user where user_id in "+
//			"<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"+
//			"</script>")
//	int batchRemove(List<Long> list);
	@Select("select `user_id`, `username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name` from sys_user where user_id = #{id}")
	SysUserDO get(Long id);
	
	@Select("<script>" +
	"select * from sys_user " + 
			"<where>" + 
		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
		  			"</where>"+ 
			"<if test=\"offset != null and limit != null\">"+
			"limit #{offset}, #{limit}" + 
			"</if>"+
			"</script>")
	List<SysUserDO> list(Map<String,Object> param);
	
	@Select("<script>" +
	"select count(*) from sys_user " + 
			"<where>" + 
		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Options(useGeneratedKeys = true, keyProperty = "userId")
	@Insert("insert into sys_user (`username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name`)"
	+ "values (#{username}, #{password}, #{email}, #{mobile}, #{status}, #{userIdCreate}, #{gmtCreate}, #{gmtModified}, #{name})")
	int save(SysUserDO obj);
	
	@Update("<script>"+ 
			"update sys_user " + 
					"<set>" + 
		            "<if test=\"userId != null\">`user_id` = #{userId}, </if>" + 
                    "<if test=\"username != null\">`username` = #{username}, </if>" + 
                    "<if test=\"password != null\">`password` = #{password}, </if>" + 
                    "<if test=\"email != null\">`email` = #{email}, </if>" + 
                    "<if test=\"mobile != null\">`mobile` = #{mobile}, </if>" + 
                    "<if test=\"status != null\">`status` = #{status}, </if>" + 
                    "<if test=\"userIdCreate != null\">`user_id_create` = #{userIdCreate}, </if>" + 
                    "<if test=\"gmtCreate != null\">`gmt_create` = #{gmtCreate}, </if>" + 
                    "<if test=\"gmtModified != null\">`gmt_modified` = #{gmtModified}, </if>" + 
                    "<if test=\"name != null\">`name` = #{name}, </if>" + 
          					"</set>" + 
					"where user_id = #{userId}"+
			"</script>")
	int update(SysUserDO obj);
	
	@Delete("delete from sys_user where user_id =#{userId}")
	int remove(Long user_id);
	
	@Delete("<script>"+ 
			"delete from sys_user where user_id in "+
			"<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"+
			"</script>")
	int batchRemove(List<Long> list);
}
