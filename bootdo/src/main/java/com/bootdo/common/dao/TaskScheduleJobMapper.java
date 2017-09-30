package com.bootdo.common.dao;

import com.bootdo.common.domain.TaskScheduleJobDO;

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
 * @date 2017-09-25 15:09:21
 */
@Mapper
public interface TaskScheduleJobMapper {

	@Select("select `id`, `cron_expression`, `method_name`, `is_concurrent`, `description`, `update_by`, `bean_class`, `create_date`, `job_status`, `job_group`, `update_date`, `create_by`, `spring_bean`, `job_name` from task_schedule_job where id = #{id}")
	TaskScheduleJobDO get(Long id);
	
	@Select("<script>" +
	"select * from task_schedule_job " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"cronExpression != null and cronExpression != ''\">"+ "and cron_expression = #{cronExpression} " + "</if>" + 
		  		  "<if test=\"methodName != null and methodName != ''\">"+ "and method_name = #{methodName} " + "</if>" + 
		  		  "<if test=\"isConcurrent != null and isConcurrent != ''\">"+ "and is_concurrent = #{isConcurrent} " + "</if>" + 
		  		  "<if test=\"description != null and description != ''\">"+ "and description = #{description} " + "</if>" + 
		  		  "<if test=\"updateBy != null and updateBy != ''\">"+ "and update_by = #{updateBy} " + "</if>" + 
		  		  "<if test=\"beanClass != null and beanClass != ''\">"+ "and bean_class = #{beanClass} " + "</if>" + 
		  		  "<if test=\"createDate != null and createDate != ''\">"+ "and create_date = #{createDate} " + "</if>" + 
		  		  "<if test=\"jobStatus != null and jobStatus != ''\">"+ "and job_status = #{jobStatus} " + "</if>" + 
		  		  "<if test=\"jobGroup != null and jobGroup != ''\">"+ "and job_group = #{jobGroup} " + "</if>" + 
		  		  "<if test=\"updateDate != null and updateDate != ''\">"+ "and update_date = #{updateDate} " + "</if>" + 
		  		  "<if test=\"createBy != null and createBy != ''\">"+ "and create_by = #{createBy} " + "</if>" + 
		  		  "<if test=\"springBean != null and springBean != ''\">"+ "and spring_bean = #{springBean} " + "</if>" + 
		  		  "<if test=\"jobName != null and jobName != ''\">"+ "and job_name = #{jobName} " + "</if>" + 
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
	List<TaskScheduleJobDO> list(Map<String,Object> map);
	
	@Select("<script>" +
	"select count(*) from task_schedule_job " + 
			"<where>" + 
		  		  "<if test=\"id != null and id != ''\">"+ "and id = #{id} " + "</if>" + 
		  		  "<if test=\"cronExpression != null and cronExpression != ''\">"+ "and cron_expression = #{cronExpression} " + "</if>" + 
		  		  "<if test=\"methodName != null and methodName != ''\">"+ "and method_name = #{methodName} " + "</if>" + 
		  		  "<if test=\"isConcurrent != null and isConcurrent != ''\">"+ "and is_concurrent = #{isConcurrent} " + "</if>" + 
		  		  "<if test=\"description != null and description != ''\">"+ "and description = #{description} " + "</if>" + 
		  		  "<if test=\"updateBy != null and updateBy != ''\">"+ "and update_by = #{updateBy} " + "</if>" + 
		  		  "<if test=\"beanClass != null and beanClass != ''\">"+ "and bean_class = #{beanClass} " + "</if>" + 
		  		  "<if test=\"createDate != null and createDate != ''\">"+ "and create_date = #{createDate} " + "</if>" + 
		  		  "<if test=\"jobStatus != null and jobStatus != ''\">"+ "and job_status = #{jobStatus} " + "</if>" + 
		  		  "<if test=\"jobGroup != null and jobGroup != ''\">"+ "and job_group = #{jobGroup} " + "</if>" + 
		  		  "<if test=\"updateDate != null and updateDate != ''\">"+ "and update_date = #{updateDate} " + "</if>" + 
		  		  "<if test=\"createBy != null and createBy != ''\">"+ "and create_by = #{createBy} " + "</if>" + 
		  		  "<if test=\"springBean != null and springBean != ''\">"+ "and spring_bean = #{springBean} " + "</if>" + 
		  		  "<if test=\"jobName != null and jobName != ''\">"+ "and job_name = #{jobName} " + "</if>" + 
		  			"</where>"+ 
			"</script>")
	int count(Map<String,Object> map);
	
	@Insert("insert into task_schedule_job (`id`, `cron_expression`, `method_name`, `is_concurrent`, `description`, `update_by`, `bean_class`, `create_date`, `job_status`, `job_group`, `update_date`, `create_by`, `spring_bean`, `job_name`)"
	+ "values (#{id}, #{cronExpression}, #{methodName}, #{isConcurrent}, #{description}, #{updateBy}, #{beanClass}, #{createDate}, #{jobStatus}, #{jobGroup}, #{updateDate}, #{createBy}, #{springBean}, #{jobName})")
	int save(TaskScheduleJobDO taskScheduleJob);
	
	@Update("<script>"+ 
			"update task_schedule_job " + 
					"<set>" + 
		            "<if test=\"id != null\">`id` = #{id}, </if>" + 
                    "<if test=\"cronExpression != null\">`cron_expression` = #{cronExpression}, </if>" + 
                    "<if test=\"methodName != null\">`method_name` = #{methodName}, </if>" + 
                    "<if test=\"isConcurrent != null\">`is_concurrent` = #{isConcurrent}, </if>" + 
                    "<if test=\"description != null\">`description` = #{description}, </if>" + 
                    "<if test=\"updateBy != null\">`update_by` = #{updateBy}, </if>" + 
                    "<if test=\"beanClass != null\">`bean_class` = #{beanClass}, </if>" + 
                    "<if test=\"createDate != null\">`create_date` = #{createDate}, </if>" + 
                    "<if test=\"jobStatus != null\">`job_status` = #{jobStatus}, </if>" + 
                    "<if test=\"jobGroup != null\">`job_group` = #{jobGroup}, </if>" + 
                    "<if test=\"updateDate != null\">`update_date` = #{updateDate}, </if>" + 
                    "<if test=\"createBy != null\">`create_by` = #{createBy}, </if>" + 
                    "<if test=\"springBean != null\">`spring_bean` = #{springBean}, </if>" + 
                    "<if test=\"jobName != null\">`job_name` = #{jobName}, </if>" + 
          					"</set>" + 
					"where id = #{id}"+
			"</script>")
	int update(TaskScheduleJobDO taskScheduleJob);
	
	@Delete("delete from task_schedule_job where id =#{id}")
	int remove(Long id);
	
	@Delete("<script>"+ 
			"delete from task_schedule_job where id in " + 
					"<foreach item=\"id\" collection=\"array\" open=\"(\" separator=\",\" close=\")\">" + 
						"#{id}" + 
					"</foreach>"+
			"</script>")
	int batchRemove(Long[] ids);
}
