
package ${config.pack}.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renxiansheng.core.support.mybatis.base.service.BaseService;
import com.renxiansheng.core.common.pojo.qo.PageQo;
import com.renxiansheng.core.support.login.entity.LoginUser;
import ${config.pack}.entity.${beanName};
import ${config.pack}.entity.${beanVo};
import ${config.pack}.entity.${beanQo};

/**
 * ${config.beanDescription} 服务层
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")} 
 */
public interface ${beanName}Service extends BaseService<${beanName}> {

	/**
	 * 分页查询
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")}
	 * @param page 分页
	 * @param ${simpleBeanName} ${config.beanDescription}
	 * @return 分页列表
	 */	 
	PageVo<${beanVo}> page(PageQo page, ${beanQo} ${simpleBeanName});
	
	/**
	 * 导出列表
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")} 
	 * @param ${simpleBeanName} ${config.beanDescription}
	 */
	List<${beanVo}> exportList(${beanQo} ${simpleBeanName});
		
	/**
	 * 添加
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")} 
	 * @param ${simpleBeanName} ${config.beanDescription}	 
	 */
	void add(${beanName} ${simpleBeanName});
	
	/**
	 * 编辑
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")} 
	 * @param ${simpleBeanName} ${config.beanDescription} 	 
	 */
	void edit(${beanName} ${simpleBeanName});

	/**
	 * 删除
	 * @author ${config.createUser}
	 * @date ${config.createTime?string("yyyy-MM-dd")} 
	 * @param ${beanId} ${config.beanDescription}id
	 */
	void delete(String ${beanId});

}
