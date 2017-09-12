package com.bootdo.blog.dao;

import com.bootdo.blog.domain.BContentDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
/**
 * 文章内容
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-11 13:48:19
 */
@Mapper
public interface BContentMapper {

	@Select("select `cid`, `title`, `slug`, `created`, `modified`, `content`, `type`, `tags`, `categories`, `hits`, `comments_num`, `allow_comment`, `allow_ping`, `allow_feed`, `status`, `author` from b_content where cid = #{id}")
	BContentDO get(Long cid);
	
	@Select("<script>" +
	"select * from b_content " + 
			"<where>" + 
		  		  "<if test=\"cid != null and cid != ''\">"+ "and cid = #{cid} " + "</if>" + 
		  		  "<if test=\"title != null and title != ''\">"+ "and title = #{title} " + "</if>" + 
		  		  "<if test=\"slug != null and slug != ''\">"+ "and slug = #{slug} " + "</if>" + 
		  		  "<if test=\"created != null and created != ''\">"+ "and created = #{created} " + "</if>" + 
		  		  "<if test=\"modified != null and modified != ''\">"+ "and modified = #{modified} " + "</if>" + 
		  		  "<if test=\"content != null and content != ''\">"+ "and content = #{content} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"tags != null and tags != ''\">"+ "and tags = #{tags} " + "</if>" + 
		  		  "<if test=\"categories != null and categories != ''\">"+ "and categories = #{categories} " + "</if>" + 
		  		  "<if test=\"hits != null and hits != ''\">"+ "and hits = #{hits} " + "</if>" + 
		  		  "<if test=\"commentsNum != null and commentsNum != ''\">"+ "and comments_num = #{commentsNum} " + "</if>" + 
		  		  "<if test=\"allowComment != null and allowComment != ''\">"+ "and allow_comment = #{allowComment} " + "</if>" + 
		  		  "<if test=\"allowPing != null and allowPing != ''\">"+ "and allow_ping = #{allowPing} " + "</if>" + 
		  		  "<if test=\"allowFeed != null and allowFeed != ''\">"+ "and allow_feed = #{allowFeed} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"author != null and author != ''\">"+ "and author = #{author} " + "</if>" + 
		  			"</where>"+ 
			" <choose>" + 
	            "<when test=\"sort != null and sort.trim() != ''\">" + 
	                "order by ${sort} ${order}" + 
	            "</when>" + 
				"<otherwise>" + 
	                "order by cid desc" + 
				"</otherwise>" + 
	        "</choose>"+
			"<if test=\"offset != null and limit != null\">"+
			"limit #{offset}, #{limit}" + 
			"</if>"+
			"</script>")
	List<BContentDO> list(Map<String,Object> map);
	
	@Select("<script>" +
	"select count(*) from b_content " + 
			"<where>" + 
		  		  "<if test=\"cid != null and cid != ''\">"+ "and cid = #{cid} " + "</if>" + 
		  		  "<if test=\"title != null and title != ''\">"+ "and title = #{title} " + "</if>" + 
		  		  "<if test=\"slug != null and slug != ''\">"+ "and slug = #{slug} " + "</if>" + 
		  		  "<if test=\"created != null and created != ''\">"+ "and created = #{created} " + "</if>" + 
		  		  "<if test=\"modified != null and modified != ''\">"+ "and modified = #{modified} " + "</if>" + 
		  		  "<if test=\"content != null and content != ''\">"+ "and content = #{content} " + "</if>" + 
		  		  "<if test=\"type != null and type != ''\">"+ "and type = #{type} " + "</if>" + 
		  		  "<if test=\"tags != null and tags != ''\">"+ "and tags = #{tags} " + "</if>" + 
		  		  "<if test=\"categories != null and categories != ''\">"+ "and categories = #{categories} " + "</if>" + 
		  		  "<if test=\"hits != null and hits != ''\">"+ "and hits = #{hits} " + "</if>" + 
		  		  "<if test=\"commentsNum != null and commentsNum != ''\">"+ "and comments_num = #{commentsNum} " + "</if>" + 
		  		  "<if test=\"allowComment != null and allowComment != ''\">"+ "and allow_comment = #{allowComment} " + "</if>" + 
		  		  "<if test=\"allowPing != null and allowPing != ''\">"+ "and allow_ping = #{allowPing} " + "</if>" + 
		  		  "<if test=\"allowFeed != null and allowFeed != ''\">"+ "and allow_feed = #{allowFeed} " + "</if>" + 
		  		  "<if test=\"status != null and status != ''\">"+ "and status = #{status} " + "</if>" + 
		  		  "<if test=\"author != null and author != ''\">"+ "and author = #{author} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Options(useGeneratedKeys = true, keyProperty = "cid")
	@Insert("insert into b_content (`title`, `slug`, `created`, `modified`, `content`, `type`, `tags`, `categories`, `hits`, `comments_num`, `allow_comment`, `allow_ping`, `allow_feed`, `status`, `author`)"
	+ "values (#{title}, #{slug}, #{created}, #{modified}, #{content}, #{type}, #{tags}, #{categories}, #{hits}, #{commentsNum}, #{allowComment}, #{allowPing}, #{allowFeed}, #{status}, #{author})")
	int save(BContentDO bContent);
	
	@Update("<script>"+ 
			"update b_content " + 
					"<set>" + 
		            "<if test=\"cid != null\">`cid` = #{cid}, </if>" + 
                    "<if test=\"title != null\">`title` = #{title}, </if>" + 
                    "<if test=\"slug != null\">`slug` = #{slug}, </if>" + 
                    "<if test=\"created != null\">`created` = #{created}, </if>" + 
                    "<if test=\"modified != null\">`modified` = #{modified}, </if>" + 
                    "<if test=\"content != null\">`content` = #{content}, </if>" + 
                    "<if test=\"type != null\">`type` = #{type}, </if>" + 
                    "<if test=\"tags != null\">`tags` = #{tags}, </if>" + 
                    "<if test=\"categories != null\">`categories` = #{categories}, </if>" + 
                    "<if test=\"hits != null\">`hits` = #{hits}, </if>" + 
                    "<if test=\"commentsNum != null\">`comments_num` = #{commentsNum}, </if>" + 
                    "<if test=\"allowComment != null\">`allow_comment` = #{allowComment}, </if>" + 
                    "<if test=\"allowPing != null\">`allow_ping` = #{allowPing}, </if>" + 
                    "<if test=\"allowFeed != null\">`allow_feed` = #{allowFeed}, </if>" + 
                    "<if test=\"status != null\">`status` = #{status}, </if>" + 
                    "<if test=\"author != null\">`author` = #{author}, </if>" + 
          					"</set>" + 
					"where cid = #{cid}"+
			"</script>")
	int update(BContentDO bContent);
	
	@Delete("delete from b_content where cid =#{cid}")
	int remove(Long cid);
	
	@Delete("<script>"+ 
			"delete from b_content where cid in " + 
					"<foreach item=\"cid\" collection=\"array\" open=\"(\" separator=\",\" close=\")\">" + 
						"#{cid}" + 
					"</foreach>"+
			"</script>")
	int batchRemove(Long[] cids);
}
