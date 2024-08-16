<template>
  <div class="dialog-container">
    <el-form :model="form" class="myForm" label-width="80px">
<#list columnList as column>		
<#if column_index!=0>	
      <el-row>
        <el-col :span="12">
          <el-form-item label="${column.dbColumnComment}">
            <el-input class="grid-input" v-model="form.${column.javaPropertyName}" readonly></el-input>
          </el-form-item>
        </el-col>
      </el-row>
</#if>				
</#list>	
    </el-form>
    <div slot="footer" class="dialog-footer">
      <div class="btn-group">
        <el-button class="grey-btn" @click="closeDialog" round>关闭</el-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "viewDialog",
  created() {},
  mounted() {
    console.log(JSON.stringify(this.params));	  
    this.initData();
  },
  props: {
    params: Object
  },
  data() {
    return {
      form: {
     <#list columnList as column>	
	 <#if column_index!=0>	
        ${column.javaPropertyName}: ""<#if column_has_next>,</#if>
	  </#if>				
      </#list>
      }
    };
  },
  methods: {
    closeDialog() {
      this.$emit('update:visible', false);
    },
    async initData() {
      let res = await this.$api.${simpleBeanName}View({
        ${simpleBeanName}Id: this.params.id
      });
      console.log(res);
      this.form=res.data;
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
