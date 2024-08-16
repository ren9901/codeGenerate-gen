
package ${config.pack}.web;

import lombok.extern.slf4j.Slf4j;

import javax.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renxiansheng.core.support.web.base.BaseController;
import com.renxiansheng.core.support.security.annotation.SysPermission;
import com.renxiansheng.core.support.log.annotation.SysLog;
import com.renxiansheng.core.common.pojo.qo.PageQo;
import com.renxiansheng.core.common.response.ResponseData;
import com.renxiansheng.core.support.login.entity.LoginUser;
import com.renxiansheng.core.common.validation.group.Add;
import com.renxiansheng.core.common.validation.group.Edit;
import ${config.pack}.entity.${beanName};
import ${config.pack}.entity.${beanQo};
import ${config.pack}.entity.${beanVo};
import ${config.pack}.service.${beanName}Service;

/**
 * ${config.beanDescription} 控制层
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")}
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/${simpleBeanName}")
public class ${beanName}Controller extends BaseController {

	@Autowired
	private ${beanName}Service ${simpleBeanName}Service;

	@RequestMapping("/page")
	@SysLog("查询${config.beanDescription}分页")
	@SysPermission("${simpleBeanName}_page")
	public ResponseData page(PageQo page,${beanQo} ${simpleBeanName}) {
		PageVo<${beanVo}> result = ${simpleBeanName}Service.page(page,${simpleBeanName});
		return ResponseData.ok(result);
	}

	@RequestMapping("/view")
	@SysLog("游览${config.beanDescription}")
	@SysPermission("${simpleBeanName}_view")
	public ResponseData view(@NotBlank String ${beanId}) {
		${beanName} result = ${simpleBeanName}Service.getById(${beanId});
		return ResponseData.ok(result);
	}

	@RequestMapping("/add")
	@SysLog("添加${config.beanDescription}")
	@SysPermission("${simpleBeanName}_add")
	public ResponseData add(@Validated(Add.class) ${beanName} ${simpleBeanName}) {
		${simpleBeanName}Service.add(${simpleBeanName});
		return ResponseData.ok();
	}

	@RequestMapping("/edit")
	@SysLog("编辑${config.beanDescription}")
	@SysPermission("${simpleBeanName}_edit")
	public ResponseData edit(@Validated(Edit.class) ${beanName} ${simpleBeanName}) {
		${simpleBeanName}Service.edit(${simpleBeanName});
		return ResponseData.ok();
	}

	@RequestMapping("/delete")
	@SysLog("删除${config.beanDescription}")
	@SysPermission("${simpleBeanName}_delete")
	public ResponseData delete(@NotBlank String ${beanId}) {
		${simpleBeanName}Service.delete(${beanId});
		return ResponseData.ok();
	}

}
