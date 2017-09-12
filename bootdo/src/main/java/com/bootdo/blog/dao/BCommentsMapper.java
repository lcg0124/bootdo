package com.bootdo.blog.dao;

import com.bootdo.blog.domain.BCommentsDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
/**
 * 
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-10 19:27:42
 */
@Mapper
public interface BCommentsMapper {

	@Select("select `id`, `created`, `title`, `author`, `author_id`, `owner_id`, `email`, `url`, `ip`, `agent`, `content`, `type`, `status`, `parent` from b_comments where id = #{id}")
	BCommentsDO get(Long id);
	
	@Select("<script>" +
	"select * from b_comments " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"created != null and created != ''\">"+ "and created = #{created} " + "</if>" + 
		  		  "<if test=\"title != null and title != ''\">"+ "and title = #{title} " + "</if>" + 
		  		  "<if test=\"author != null and author != ''\">"+ "and author = #{author} " + "</if>" + 
		  		  "<if test=\"authorId != null and authorId != ''\">"+ "and author_id = #{authorId} " + "</if>" + 
		  		  "<if test=\"ownerId != null and ownerId != ''\">"+ "and owner_id = #{ownerId} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"url != null and url != ''\">"+ "and url = #{url} " + "</if>" + 
		  		  "<if test=\"ip != null and ip != ''\">"+ "and ip = #{ip} " + "</if>" + 
		  		  "<if test=\"agent != null and agent != ''\">"+ "and agent = #{agent} " + "</if>" + 
		  		  "<if test=\"content != null and content != ''\">"+ "and content = #{content} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"parent != null and parent != ''\">"+ "and parent = #{parent} " + "</if>" + 
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
	List<BCommentsDO> list(Map<String,Object> map);
	
	@Select("<script>" +
	"select count(*) from b_comments " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"created != null and created != ''\">"+ "and created = #{created} " + "</if>" + 
		  		  "<if test=\"title != null and title != ''\">"+ "and title = #{title} " + "</if>" + 
		  		  "<if test=\"author != null and author != ''\">"+ "and author = #{author} " + "</if>" + 
		  		  "<if test=\"authorId != null and authorId != ''\">"+ "and author_id = #{authorId} " + "</if>" + 
		  		  "<if test=\"ownerId != null and ownerId != ''\">"+ "and owner_id = #{ownerId} " + "</if>" + 
		  		  "<if test=\"email != null and email != ''\">"+ "and email = #{email} " + "</if>" + 
		  		  "<if test=\"url != null and url != ''\">"+ "and url = #{url} " + "</if>" + 
		  		  "<if test=\"ip != null and ip != ''\">"+ "and ip = #{ip} " + "</if>" + 
		  		  "<if test=\"agent != null and agent != ''\">"+ "and agent = #{agent} " + "</if>" + 
		  		  "<if test=\"content != null and content != ''\">"+ "and content = #{content} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"parent != null and parent != ''\">"+ "and parent = #{parent} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Insert("insert into b_comments (`created`, `title`, `author`, `author_id`, `owner_id`, `email`, `url`, `ip`, `agent`, `content`, `type`, `status`, `parent`)"
	+ "values (#{created}, #{title}, #{author}, #{authorId}, #{ownerId}, #{email}, #{url}, #{ip}, #{agent}, #{content}, #{type}, #{status}, #{parent})")
	int save(BCommentsDO bComments);
	
	@Update("<script>"+ 
			"update b_comments " + 
					"<set>" + 
		            "<if test=\"id != null\">`id` = #{id}, </if>" + 
                    "<if test=\"created != null\">`created` = #{created}, </if>" + 
                    "<if test=\"title != null\">`title` = #{title}, </if>" + 
                    "<if test=\"author != null\">`author` = #{author}, </if>" + 
                    "<if test=\"authorId != null\">`author_id` = #{authorId}, </if>" + 
                    "<if test=\"ownerId != null\">`owner_id` = #{ownerId}, </if>" + 
                    "<if test=\"email != null\">`email` = #{email}, </if>" + 
                    "<if test=\"url != null\">`url` = #{url}, </if>" + 
                    "<if test=\"ip != null\">`ip` = #{ip}, </if>" + 
                    "<if test=\"agent != null\">`agent` = #{agent}, </if>" + 
                    "<if test=\"content != null\">`content` = #{content}, </if>" + 
                    "<if test=\"type != null\">`type` = #{type}, </if>" + 
                    "<if test=\"status != null\">`status` = #{status}, </if>" + 
                    "<if test=\"parent != null\">`parent` = #{parent}, </if>" + 
          					"</set>" + 
					"where id = #{id}"+
			"</script>")
	int update(BCommentsDO bComments);
	
	@Delete("delete from b_comments where id =#{id}")
	int remove(Integer id);
	
	@Delete("<script>"+ 
			"delete from b_comments where id in " + 
					"<foreach item=\"id\" collection=\"array\" open=\"(\" separator=\",\" close=\")\">" + 
						"#{id}" + 
					"</foreach>"+
			"</script>")
	int batchRemove(Integer[] ids);
}
