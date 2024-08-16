
package ${config.pack}.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renxiansheng.core.support.mybatis.base.mapper.BaseMapper;
import ${config.pack}.entity.${beanName};
import ${config.pack}.entity.${beanVo};
import ${config.pack}.entity.${beanQo};

/**
 * ${config.beanDescription} 数据层
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")} 
 */
@Mapper
public interface ${beanName}Mapper extends BaseMapper<${beanName}> {

	/**
	 * 编辑
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")} 
	 * @param ${simpleBeanName}
	 */
	void edit(${beanName} ${simpleBeanName});

	/**
	 * 查询分页列表
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")}  
	 * @param page
	 * @param ${simpleBeanName}
	 * @return
	 */	 
	Page<${beanVo}> page(Page<${beanVo}> page, @Param("qo") ${beanQo} ${simpleBeanName});

}
