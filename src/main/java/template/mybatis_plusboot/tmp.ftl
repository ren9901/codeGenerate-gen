>>>>>>>>>>>>>>>>>查询条件构造 start
${"\t"}${"\t"}<where>
<#list columnList as column>
${"\t"}${"\t"}${"\t"}<if test="${column.javaPropertyName} != null<#if column.mybatisJdbcType!='TIMESTAMP'> and ${column.javaPropertyName} !=''</#if>">
${"\t"}${"\t"}${"\t"}${"\t"}AND ${column.dbColumnName} = ${r"#{"}${column.javaPropertyName}, jdbcType=${column.mybatisJdbcType}${r"}"}
${"\t"}${"\t"}${"\t"}</if>			
</#list>
${"\t"}${"\t"}</where>
>>>>>>>>>>>>>>>>>查询条件构造 end