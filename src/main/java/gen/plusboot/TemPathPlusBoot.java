
package gen.plusboot;

import java.util.LinkedHashMap;
import java.util.Map;

import codeGenerate.mybatis.tempalte.TemPathAbstract;
import codeGenerate.mybatis.vo.ConfigVo;

public class TemPathPlusBoot extends TemPathAbstract {

	/**
	 * 模版相对根路径
	 */
	private static final String RELATIVE_PATH_ROOT = "/mybatis_plusboot";

	@Override
	public Map<String, String> getPathMap(ConfigVo configVo) {

		Map<String, String> fileMap = new LinkedHashMap<String, String>();
		//后台代码
		String srcPath = configVo.getGenPath() + "/src/" + configVo.getPack().replace(".", "/");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/common/constants.ftl", srcPath + "/common/" + configVo.getBeanName() + "Constants.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/entity/pojo.ftl", srcPath + "/entity/" + configVo.getBeanName() + ".java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/entity/pojoQuery.ftl", srcPath + "/entity/" + configVo.getBeanName() + "Qo.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/entity/pojoShow.ftl", srcPath + "/entity/" + configVo.getBeanName() + "Vo.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/mapper/mapper.java.ftl", srcPath + "/mapper/" + configVo.getBeanName() + "Mapper.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/mapper/mapper.xml.ftl", srcPath + "/mapper/" + configVo.getBeanName() + "Mapper.xml");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/service/impl/serviceImpl.ftl", srcPath + "/service/impl/" + configVo.getBeanName() + "ServiceImpl.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/service/service.ftl", srcPath + "/service/" + configVo.getBeanName() + "Service.java");
		fileMap.put(RELATIVE_PATH_ROOT + "/src/web/controller.ftl", srcPath + "/web/" + configVo.getBeanName() + "Controller.java");
		//首字母小写
		String simpleName = configVo.getBeanName().substring(0, 1).toLowerCase() + configVo.getBeanName().substring(1);
		//swagger
		fileMap.put(RELATIVE_PATH_ROOT + "/swagger/swagger.ftl", configVo.getGenPath() + "/" + simpleName + "Swagger.json");

		//页面模板
		fileMap.put(RELATIVE_PATH_ROOT + "/pageTemplate/pageTemplate.ftl", configVo.getGenPath() + "/" + simpleName + "PageTemplate.json");

		//前端代码
		String jspPath = configVo.getGenPath() + "/page/" + simpleName;
		fileMap.put(RELATIVE_PATH_ROOT + "/page/api.ftl", jspPath + "/" + simpleName + ".js");
		fileMap.put(RELATIVE_PATH_ROOT + "/page/index.ftl", jspPath + "/index.vue");
		fileMap.put(RELATIVE_PATH_ROOT + "/page/edit.ftl", jspPath + "/component/edit.vue");
		fileMap.put(RELATIVE_PATH_ROOT + "/page/view.ftl", jspPath + "/component/view.vue");

		//临时代码
		fileMap.put(RELATIVE_PATH_ROOT + "/tmp.ftl", configVo.getGenPath() + "/" + simpleName + "Tmp.xml");
		return fileMap;
	}

}
