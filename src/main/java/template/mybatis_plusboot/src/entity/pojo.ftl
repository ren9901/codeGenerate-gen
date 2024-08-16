
package ${config.pack}.entity;

<#list packageSet as package>
import ${package};
</#list>
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.renxiansheng.core.support.mybatis.base.entity.BaseBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * ${config.beanDescription}
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")}
 */
@Setter
@Getter
@ToString
@TableName("${config.tblName}")
public class ${beanName} extends BaseBean {${"\n"}
${"\t"}private static final long serialVersionUID = ${commonFunction.serialVersionUID()}L;${"\n"}
<#list columnList as column>
<#if column_index==0>
${"\t"}/**
${"\t"}* ${column.dbColumnComment}
${"\t"}*/
${"\t"}@TableId
<#else>
${"\t"}/**
${"\t"}* ${column.dbColumnComment}
${"\t"}*/
</#if>
${"\t"}private ${column.javaPropertyType} ${column.javaPropertyName};${"\n"}
</#list>
}
