temptData: {
        searchtmp:{
          list:[  
          
          ],
          api:"/${simpleBeanName}/list"
        },
        buttonGroup:[
            {
              type: "addEv",
              tmp: "addTmp",
              name: "新增",
            },
        ],
        tableData: {
          list: [
<#list columnList as column>           
            { label: "${column.dbColumnComment}", minWidth: "200", key: "${column.javaPropertyName}" }<#if column_has_next>,</#if>
</#list>            
          ],
          operateWidth:'200',//操作部分的长度，按钮数量太多或太少需要设置
          operate: [
            {
              type: "editEv",
              tmp: "editTmp",
              name: "编辑",
            },
            {
              type: "viewEv",
              name: "查看",
              tmp: "viewTmp",
            },
            {
              type: "delectEv",
              name: "删除",
            },
          ],
        },
        addtmp:{
          list: [
<#list columnList as column>          
            {
              label: "${column.dbColumnComment}",
              key: "${column.javaPropertyName}",
              type: "input",
              iniValue: "",
              ismust:'0',
              span: "8",
            }<#if column_has_next>,</#if>
</#list>            
          ],
          buttonGroup: [
            {
              type: "save",
              name: "保存",
              excuteApi: "/${simpleBeanName}/add",
              excuteApi: {}
            },
            {
              type: "back",
              name: "返回",
            },
          ],
        },
        editTmp: {
          list: [
<#list columnList as column>          
            {
              label: "${column.dbColumnComment}",
              key: "${column.javaPropertyName}",
              type: "input",
              iniValue: "",
              ismust:'0', 
              span: "8",
            }<#if column_has_next>,</#if>
</#list>
          ],
          viewApi: "/${simpleBeanName}/view",
          viewParams: {
            ${idColumn.javaPropertyName}: "id"
          }, 
          buttonGroup: [
            {
              type: "save",
              name: "保存",
              excuteApi: "/${simpleBeanName}/edit",
              excuteApi: { id: "${idColumn.javaPropertyName}" }, //${idColumn.javaPropertyName}对应viewParams里头的参数
            },
            {
              type: "back",
              name: "返回",
            },
          ],
        },
        viewTmp: {
            list: [
<#list columnList as column>            
              {
                label: "${column.dbColumnComment}",
                key: "${column.javaPropertyName}",
                type: "view",
                iniValue: "",
                span: "8",
              }<#if column_has_next>,</#if>
</#list>
            ],
            viewApi: "/${simpleBeanName}/view",
            viewParams: {
              ${idColumn.javaPropertyName}: "id"
            }, //值代表从table列表中填入的对应字段
            buttonGroup: [
              {
                type: "back",
                name: "返回",
              },
            ],
        },
      }