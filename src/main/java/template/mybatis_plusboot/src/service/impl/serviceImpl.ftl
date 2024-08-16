
package ${config.pack}.service.impl;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renxiansheng.core.support.mybatis.base.service.impl.BaseServiceImpl;
import com.renxiansheng.core.support.mybatis.utils.PageUtils;
import com.renxiansheng.core.common.pojo.qo.PageQo;
import com.renxiansheng.core.support.login.entity.LoginUser;
import ${config.pack}.entity.${beanName};
import ${config.pack}.entity.${beanVo};
import ${config.pack}.entity.${beanQo};
import ${config.pack}.mapper.${beanName}Mapper;
import ${config.pack}.service.${beanName}Service;

/**
 * ${config.beanDescription} 服务层实现
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")}
 */
@Slf4j
@Service
public class ${beanName}ServiceImpl extends BaseServiceImpl<${beanName}Mapper, ${beanName}> implements ${beanName}Service {

	@Autowired
	private ${beanName}Mapper ${simpleBeanName}Mapper;

	@Override
	public PageVo<${beanVo}> page(PageQo page, ${beanQo} ${simpleBeanName})  {
		Page<${beanVo}> result = ${simpleBeanName}Mapper.page(PageUtils.toMapperPage(page), ${simpleBeanName});
		return PageUtils.toPageVo(result);
	}

	@Override
	public List<${beanVo}> exportList(${beanQo} ${simpleBeanName}) {
		return ${simpleBeanName}Mapper.page(PageUtils.toMapperPageAll(), ${simpleBeanName}).getRecords();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void add(${beanName} ${simpleBeanName}) {
	//	${simpleBeanName}.set${columnList[0].javaPropertyName?cap_first}(IdUtils.genId());
		${simpleBeanName}Mapper.insert(${simpleBeanName});
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void edit(${beanName} ${simpleBeanName})  {
		${simpleBeanName}Mapper.edit(${simpleBeanName});
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void delete(String ${beanId})  {
		 ${simpleBeanName}Mapper.deleteById(${beanId});
	}

}
