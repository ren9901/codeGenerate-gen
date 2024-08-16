<template>
  <div class="dialog-container" v-loading="dialogLoading">
    <el-form :model="form" :rules="rules" ref="ruleForm" class="myForm" label-width="80px">
<#list columnList as column>
<#if column_index!=0>
      <el-row>
        <el-col :span="12">
          <el-form-item label="${column.dbColumnComment}"  prop="${column.javaPropertyName}">
            <el-input class="grid-input" v-model="form.${column.javaPropertyName}" placeholder="请输入${column.dbColumnComment}" clearable></el-input>
          </el-form-item>
        </el-col>
      </el-row>
</#if>
</#list>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <div class="btn-group">
        <el-button class="grey-btn" @click="closeDialog" round>关闭</el-button>
        <el-button class="blue-btn" @click="save" round>保存</el-button>
      </div>
    </span>
  </div>
</template>

<script>
export default {
  name: "editDialog",
  created() {},
  mounted() {
    console.log(JSON.stringify(this.params));
    if (this.params.dialogType == "edit") {
      this.initData();
    }
  },
  props: {
    params: Object
  },
  data() {
    return {
      dialogLoading:false,
      //字典项
      options: {
      },
      //表单字段项
      form: {
	 <#list columnList as column>	
	 <#if column_index!=0>	
        ${column.javaPropertyName}: ""<#if column_has_next>,</#if>
	  </#if>				
      </#list>	
      },
      //验证规则    
      rules: {
	 <#list columnList as column>	
	 <#if column_index!=0>	
        ${column.javaPropertyName}: [
          { required: true, message: "请输入${column.dbColumnComment}", trigger: "blur" }
        ]<#if column_has_next>,</#if>
	 </#if>				
     </#list>	
      }
    };
  },
  methods: {
    closeDialog() {
      this.$emit('update:visible', false);
    },
    refreshList(){
      this.$emit("search");
    },    
    async initData() {
      this.dialogLoading = true;
      let res = await this.$api.${simpleBeanName}View({
        ${simpleBeanName}Id: this.params.id
      });
      console.log(res);
      this.form = res.data;
      this.dialogLoading = false;
    },
    save() {
      //验证表单
      this.$refs.ruleForm.validate(async (valid) => {
        if (valid) {
          this.dialogLoading = true;
          if (this.params.dialogType == "add") {
            console.log(this.form);
            let res = await this.$api.${simpleBeanName}Add(this.form);
            if (res.isSuccess) {
              this.$showMessage("保存成功");
              this.refreshList();
              this.closeDialog();              
            } 
          } else if (this.params.dialogType == "edit") {
            console.log(this.form);
            let res = await  this.$api.${simpleBeanName}Edit(this.form);
            if (res.isSuccess) {
              this.$showMessage("修改成功");
              this.refreshList();
              this.closeDialog();
            } 
          }
          this.dialogLoading = false;
        } else {
          console.log("提交失败!!");
          return false;
        }
      });
    }
    
  }
};
</script>
<style scoped lang="scss">
.dialog-container {
  /deep/ .el-dialog /deep/ .el-dialog__body {
    padding: 30px 60px;
  }
  .picker {
    width: 142px;
    /deep/ input {
      width: 142px;
    }
  }
}
</style>
