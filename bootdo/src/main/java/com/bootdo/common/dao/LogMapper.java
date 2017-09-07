package com.bootdo.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.bootdo.common.domain.SysLogDO;

public interface LogMapper {

	
	@Select("<script>" +
	"select * from sys_log " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"userId != null and userId != ''\">"+ "and user_id = #{userId} " + "</if>" + 
		  		  "<if test=\"username != null and username != ''\">"+ "and username = #{username} " + "</if>" + 
		  		  "<if test=\"operation != null and operation != ''\">"+ "and operation = #{operation} " + "</if>" + 
		  		  "<if test=\"time != null and time != ''\">"+ "and time = #{time} " + "</if>" + 
		  		  "<if test=\"method != null and method != ''\">"+ "and method = #{method} " + "</if>" + 
		  		  "<if test=\"params != null and params != ''\">"+ "and params = #{params} " + "</if>" + 
		  		  "<if test=\"ip != null and ip != ''\">"+ "and ip = #{ip} " + "</if>" + 
		  		  "<if test=\"gmtCreate != null and gmtCreate != ''\">"+ "and gmt_create = #{gmtCreate} " + "</if>" + 
		  			"</where>"+ 
			" <choose>" + 
	            "<when test=\"sort != null and sort.trim() != ''\">" + 
	                "order by ${sort} ${order}" + 
	            "</when>" + 
				"<otherwise>" + 
	                "order by id desc" + 
				"</otherwise>" + 
	        "</choose>"+
			"<if test=\"offset != null and limit != null\">"+
			"limit #{offset}, #{limit}" + 
			"</if>"+
			"</script>")
	List<SysLogDO> list(Map<String,Object> map);

	@Select("select count(*) from sys_log")
	int count();

	@Insert("insert into sys_log (id, user_id, username,operation, time, method,params, ip, gmt_create)"
			+ "values (#{id,jdbcType=BIGINT}, #{userId,jdbcType=BIGINT}, #{username,jdbcType=VARCHAR}, "
			+ "#{operation,jdbcType=VARCHAR}, #{time,jdbcType=INTEGER}, #{method,jdbcType=VARCHAR}, "
			+ "#{params,jdbcType=VARCHAR}, #{ip,jdbcType=VARCHAR}, #{gmtCreate,jdbcType=TIMESTAMP})")
	int save(SysLogDO log);

	@Update("<script>" + "update sys_log " + "<set>" + "<if test=\"userId != null\">`user_id` = #{userId}, </if>"
			+ "<if test=\"username != null\">`username` = #{username}, </if>"
			+ "<if test=\"operation != null\">`operation` = #{operation}, </if>"
			+ "<if test=\"time != null\">`time` = #{time}, </if>"
			+ "<if test=\"method != null\">`method` = #{method}, </if>"
			+ "<if test=\"params != null\">`params` = #{params}, </if>" + "<if test=\"ip != null\">`ip` = #{ip}, </if>"
			+ "<if test=\"gmtCreate != null\">`gmt_create` = #{gmtCreate}</if>" + "</set>" + "where id = #{id}"
			+ "</script>")
	int update(SysLogDO log);

	@Delete("delete from sys_log where id =#{id}")
	int remove(Long id);

	@Delete("<script>" + "delete from sys_log where id in "
			+ "<foreach collection=\"list\" index=\"i\" open=\"(\" separator=\",\" close=\")\" item=\"item\"  >#{item}</foreach>"
			+ "</script>")
	int batchRemove(List<Long> list);
}
