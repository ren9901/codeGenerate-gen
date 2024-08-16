{
  "swagger": "2.0",
  "info": {
    "title": "",
    "version": "last"
  },
  "basePath": "/",
  "tags": [],
  "schemes": [
    "http"
  ],
  "paths": {
    "/${simpleBeanName}/add": {
      "post": {
        "tags": [],
        "summary": "添加${config.beanDescription}",
        "description": "",
        "consumes": [
          "multipart/form-data"
        ],
        "parameters": [
<#list columnList as column>
			<#if column_index!=0>
          {
            "name": "${column.javaPropertyName}",
            "in": "formData",
            "required": false,
            "description": "${column.dbColumnComment}",
            "type": "string"
          }<#if column_has_next>,</#if>
			</#if>
</#list>
        ],
        "responses": {
          "200": {
            "description": "successful operation",
            "schema": {
              "$schema": "http://json-schema.org/draft-04/schema#",
              "type": "object",
              "properties": {
                "code": {
                  "type": "number",
                  "description": "返回码"
                },
                "msg": {
                  "type": "string",
                  "description": "返回信息"
                }
              }
            }
          }
        }
      }
    },


    "/${simpleBeanName}/edit": {
      "post": {
        "tags": [],
        "summary": "修改${config.beanDescription}",
        "description": "",
        "consumes": [
          "multipart/form-data"
        ],
        "parameters": [
<#list columnList as column>
          {
            "name": "${column.javaPropertyName}",
            "in": "formData",
            "required": false,
            "description": "${column.dbColumnComment}",
            "type": "string"
          }<#if column_has_next>,</#if>
</#list>
        ],
        "responses": {
          "200": {
            "description": "successful operation",
            "schema": {
              "$schema": "http://json-schema.org/draft-04/schema#",
              "type": "object",
              "properties": {
                "code": {
                  "type": "number",
                  "description": "返回码"
                },
                "msg": {
                  "type": "string",
                  "description": "返回信息"
                }
              }
            }
          }
        }
      }
    },


    "/${simpleBeanName}/delete": {
      "post": {
        "tags": [],
        "summary": "删除${config.beanDescription}",
        "description": "",
        "consumes": [
          "multipart/form-data"
        ],
        "parameters": [
          {
            "name": "${beanId}",
            "in": "formData",
            "required": false,
            "description": "${columnList[0].dbColumnComment}",
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "successful operation",
            "schema": {
              "$schema": "http://json-schema.org/draft-04/schema#",
              "type": "object",
              "properties": {
                "code": {
                  "type": "number",
                  "description": "返回码"
                },
                "msg": {
                  "type": "string",
                  "description": "返回信息"
                }
              }
            }
          }
        }
      }
    },

    "/${simpleBeanName}/view": {
      "post": {
        "tags": [],
        "summary": "详情${config.beanDescription}",
        "description": "",
        "consumes": [
          "multipart/form-data"
        ],
        "parameters": [
          {
            "name": "${beanId}",
            "in": "formData",
            "required": false,
            "description": "${columnList[0].dbColumnComment}",
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "successful operation",
            "schema": {
              "$schema": "http://json-schema.org/draft-04/schema#",
              "type": "object",
              "properties": {
                "code": {
                  "type": "number",
                  "description": "返回码"
                },
                "msg": {
                  "type": "string",
                  "description": "返回码信息"
                },
                "data": {
                  "type": "object",
                  "description": "返回数据",
                  "properties": {

<#list columnList as column>
                    "${column.javaPropertyName}": {
                      "type": "string",
					  "description": "${column.dbColumnComment}"
                    }<#if column_has_next>,</#if>
</#list>
                  }
                }
              }
            }
          }
        }
      }
    },


    "/${simpleBeanName}/page": {
      "post": {
        "tags": [],
        "summary": "列表${config.beanDescription}",
        "description": "",
        "consumes": [
          "multipart/form-data"
        ],
        "parameters": [
          {
            "name": "currentPage",
            "in": "formData",
            "required": false,
            "description": "当前页数，不传默认第一页",
            "type": "string"
          },
          {
            "name": "limit",
            "in": "formData",
            "required": false,
            "description": "每页数据个数",
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "successful operation",
            "schema": {
              "$schema": "http://json-schema.org/draft-04/schema#",
              "type": "object",
              "properties": {
                "code": {
                  "type": "number",
                  "description": "返回码"
                },
                "msg": {
                  "type": "string",
                  "description": "返回码信息"
                },
                "data": {
                  "type": "object",
                  "properties": {
                   "rowCount": {
                      "type": "number",
					  "description": "总记录数"
                    },
                    "currentPage": {
                      "type": "number",
					  "description": "当前页数"
                    },
                    "pageCount": {
                      "type": "number",
					  "description": "总页数"
                    },
                    "dataList": {
                      "type": "array",
                      "description": "数据列表"	,
                      "items": {
                        "type": "object",
                        "properties": {
<#list columnList as column>
                          "${column.javaPropertyName}": {
                            "type": "string",
                            "description": "${column.dbColumnComment}"
                          }<#if column_has_next>,</#if>
</#list>
                        },
                        "required": []
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }




  }
}
