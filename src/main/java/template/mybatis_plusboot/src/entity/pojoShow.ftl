
package ${config.pack}.entity;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * ${config.beanDescription}视图
 * @copyright ${config.copyright}
 * @author ${config.createUser}
 * @since ${config.createTime?string("yyyy-MM-dd")}
 */
@Setter
@Getter
@ToString
public class ${beanVo} extends ${beanName} {${"\n"}
${"\t"}private static final long serialVersionUID = ${commonFunction.serialVersionUID()}L;${"\n"}
}
