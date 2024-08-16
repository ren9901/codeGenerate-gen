<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${config.pack}.mapper.${beanName}Mapper">

${"\t"}<resultMap type="${beanName}" id="${simpleBeanName}ResultMap">
${"\t"}${"\t"}<id property="${columnList[0].javaPropertyName}" column="${columnList[0].dbColumnName}"  jdbcType="${columnList[0].mybatisJdbcType}"/>
		<#list columnList as column>
			<#if column_index!=0>
${"\t"}${"\t"}<result property="${column.javaPropertyName}" column="${column.dbColumnName}" jdbcType="${column.mybatisJdbcType}"/>
			</#if>
		</#list>
${"\t"}</resultMap>

${"\t"}<resultMap type="${beanVo}" id="${simpleBeanName}VoResultMap" extends="${simpleBeanName}ResultMap">
${"\t"}</resultMap>

${"\t"}<update id="edit">
${"\t"}${"\t"}UPDATE ${config.tblName} SET
			<#list columnList as column>
			<#if column_index!=0>
${"\t"}${"\t"}${"\t"}${column.dbColumnName} = ${r"#{"}${column.javaPropertyName}, jdbcType=${column.mybatisJdbcType}${r"}"}<#if column_has_next>,</#if>
			</#if>
			</#list>
${"\t"}${"\t"}WHERE ${columnList[0].dbColumnName} = ${r"#{"}${columnList[0].javaPropertyName}${r"}"}
${"\t"}</update>

${"\t"}<select id="page" resultMap="${simpleBeanName}VoResultMap">
${"\t"}${"\t"}SELECT * FROM ${config.tblName}
${"\t"}${"\t"}<where>
			<#list columnList as column>
${"\t"}${"\t"}${"\t"}<if test="qo.${column.javaPropertyName} != null<#if column.mybatisJdbcType!='TIMESTAMP'> and qo.${column.javaPropertyName} !=''</#if>">
${"\t"}${"\t"}${"\t"}${"\t"}AND	${column.dbColumnName} = ${r"#{qo."}${column.javaPropertyName}, jdbcType=${column.mybatisJdbcType}${r"}"}
${"\t"}${"\t"}${"\t"}</if>
			</#list>
${"\t"}${"\t"}</where>
${"\t"}${"\t"} ORDER BY CREATE_TIME DESC
${"\t"}</select>

</mapper>
