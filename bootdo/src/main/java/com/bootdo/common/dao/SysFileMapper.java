package com.bootdo.common.dao;

import com.bootdo.common.domain.SysFileDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
/**
 * 文件上传
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-19 16:02:20
 */
@Mapper
public interface SysFileMapper {

	@Select("select `id`, `type`, `url`, `create_date` from sys_file where id = #{id}")
	SysFileDO get(Long id);
	
	@Select("<script>" +
	"select `id`, `type`, `url`, `create_date` from sys_file " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"url != null and url != ''\">"+ "and url = #{url} " + "</if>" + 
		  		  "<if test=\"createDate != null and createDate != ''\">"+ "and create_date = #{createDate} " + "</if>" + 
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
	List<SysFileDO> list(Map<String,Object> map);
	
	@Select("<script>" +
	"select count(*) from sys_file " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"url != null and url != ''\">"+ "and url = #{url} " + "</if>" + 
		  		  "<if test=\"createDate != null and createDate != ''\">"+ "and create_date = #{createDate} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Insert("insert into sys_file (`type`, `url`, `create_date`)"
	+ "values (#{type}, #{url}, #{createDate})")
	int save(SysFileDO sysFile);
	
	@Update("<script>"+ 
			"update sys_file " + 
					"<set>" + 
		            "<if test=\"id != null\">`id` = #{id}, </if>" + 
                    "<if test=\"type != null\">`type` = #{type}, </if>" + 
                    "<if test=\"url != null\">`url` = #{url}, </if>" + 
                    "<if test=\"createDate != null\">`create_date` = #{createDate}, </if>" + 
          					"</set>" + 
					"where id = #{id}"+
			"</script>")
	int update(SysFileDO sysFile);
	
	@Delete("delete from sys_file where id =#{id}")
	int remove(Long id);
	
	@Delete("<script>"+ 
			"delete from sys_file where id in " + 
					"<foreach item=\"id\" collection=\"array\" open=\"(\" separator=\",\" close=\")\">" + 
						"#{id}" + 
					"</foreach>"+
			"</script>")
	int batchRemove(Long[] ids);
}
