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

//	@Select("select `user_id`, `username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name` from sys_user where user_id = #{id}")
//	SysUserDO get(Long id);
//	
//	@Select("<script>" +
//	"select * from sys_user " + 
//			"<where>" + 
//		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
//		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
//		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
//		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
//		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
//		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
//		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
//		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
//		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
//		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
//		  			"</where>"+ 
//			"<if test=\"offset != null and limit != null\">"+
//			"limit #{offset}, #{limit}" + 
//			"</if>"+
//			"</script>")
//	List<SysUserDO> list(Map<String,Object> param);
//	
//	@Select("<script>" +
//	"select count(*) from sys_user " + 
//			"<where>" + 
//		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
//		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
//		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
//		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
//		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
//		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
//		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
//		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
//		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
//		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
//		  			"</where>"+ 
//			"</script>")
//	int count(Map<String,Object> map);
//	
//	@Options(useGeneratedKeys = true, keyProperty = "userId")
//	@Insert("insert into sys_user (`username`, `password`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `name`)"
//	+ "values (#{username}, #{password}, #{email}, #{mobile}, #{status}, #{userIdCreate}, #{gmtCreate}, #{gmtModified}, #{name})")
//	int save(SysUserDO obj);
//	
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
//          					"</set>" + 
//					"where user_id = #{userId}"+
//			"</script>")
//	int update(SysUserDO obj);
//	
//	@Delete("delete from sys_user where user_id =#{userId}")
//	int remove(Long user_id);
//	
//	@Delete("<script>"+ 
//			"delete from sys_user where user_id in "+
//			"<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"+
//			"</script>")
//	int batchRemove(List<Long> list);
	@Select("select `user_id`, `username`, `name`, `password`, `dept_id`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified` from sys_user where user_id = #{id}")
	SysUserDO get(Long userId);
	
	@Select("<script>" +
	"select * from sys_user " + 
			"<where>" + 
		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
		  		  "<if test=\"deptId != null and deptId != ''\">"+ "and dept_id = #{deptId} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
		  			"</where>"+ 
			" <choose>" + 
	            "<when test=\"sort != null and sort.trim() != ''\">" + 
	                "order by ${sort} ${order}" + 
	            "</when>" + 
				"<otherwise>" + 
	                "order by user_id desc" + 
				"</otherwise>" + 
	        "</choose>"+
			"<if test=\"offset != null and limit != null\">"+
			"limit #{offset}, #{limit}" + 
			"</if>"+
			"</script>")
	List<SysUserDO> list(Map<String,Object> map);
	
	@Select("<script>" +
	"select count(*) from sys_user " + 
			"<where>" + 
		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
		  		  "<if test=\"name != null and name != ''\">"+ "and name = #{name} " + "</if>" + 
		  		  "<if test=\"password != null and password != ''\">"+ "and password = #{password} " + "</if>" + 
		  		  "<if test=\"deptId != null and deptId != ''\">"+ "and dept_id = #{deptId} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"mobile != null and mobile != ''\">"+ "and mobile = #{mobile} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"userIdCreate != null and userIdCreate != ''\">"+ "and user_id_create = #{userIdCreate} " + "</if>" + 
		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
		  		  "<if test=\"gmtModified != null and gmtModified != ''\">"+ "and gmt_modified = #{gmtModified} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Insert("insert into sys_user (`username`, `name`, `password`, `dept_id`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`)"
	+ "values (#{username}, #{name}, #{password}, #{deptId}, #{email}, #{mobile}, #{status}, #{userIdCreate}, #{gmtCreate}, #{gmtModified})")
	int save(SysUserDO sysUser);
	
	@Update("<script>"+ 
			"update sys_user " + 
					"<set>" + 
		            "<if test=\"userId != null\">`user_id` = #{userId}, </if>" + 
                    "<if test=\"username != null\">`username` = #{username}, </if>" + 
                    "<if test=\"name != null\">`name` = #{name}, </if>" + 
                    "<if test=\"password != null\">`password` = #{password}, </if>" + 
                    "<if test=\"deptId != null\">`dept_id` = #{deptId}, </if>" + 
                    "<if test=\"email != null\">`email` = #{email}, </if>" + 
                    "<if test=\"mobile != null\">`mobile` = #{mobile}, </if>" + 
                    "<if test=\"status != null\">`status` = #{status}, </if>" + 
                    "<if test=\"userIdCreate != null\">`user_id_create` = #{userIdCreate}, </if>" + 
                    "<if test=\"gmtCreate != null\">`gmt_create` = #{gmtCreate}, </if>" + 
                    "<if test=\"gmtModified != null\">`gmt_modified` = #{gmtModified}, </if>" + 
          					"</set>" + 
					"where user_id = #{userId}"+
			"</script>")
	int update(SysUserDO sysUser);
	
	@Delete("delete from sys_user where user_id =#{userId}")
	int remove(Long user_id);
	
	@Delete("<script>"+ 
	"delete from sys_user where user_id in "+
	"<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"+
	"</script>")
	int batchRemove(List<Long> list);
}
