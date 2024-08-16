<template>
  <div class="container">
  <!-- 查询 -->
    <div class="search-box">
      <el-row :gutter="20">
        <el-col :span="7">
          <span class="label">是否有效：</span>
          <el-select v-model="searchForm.isActive" placeholder="请选择">
            <el-option
                            v-for="item in options.dicType"
                            :label="item.name"
                            :value="item.value">
                            </el-option>
                        </el-select>
        </el-col>
        <el-col :span="6">
          <span class="label">id：</span>
          <el-input v-model="searchForm.id" placeholder="请输入内容" clearable></el-input>
        </el-col>
        <el-col :span="8">
          <span class="label">创建时间：</span>
          <el-date-picker
            v-model="searchForm.date"
            type="daterange"
            value-format="yyyy-MM-dd"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
          ></el-date-picker>
        </el-col>
      </el-row>
      <el-row class="btn-group">
        <el-button class="blue-btn" @click="search" round>查询</el-button>
        <el-button class="green-btn" @click="reset" round>重置</el-button>
      </el-row>
    </div>

    <div class="main">
      <div class="options">
        <el-button v-allow="'${simpleBeanName}_add'" class="blue-btn" @click="add">
          <svg-icon icon-class="add" class-name="add" />新建
        </el-button>
      </div>
      <div class="table-wrap">
        <el-table
          v-loading="table.loading"
          :data="table.list"
          element-loading-text="Loading"
          fit
          stripe
          highlight-current-row
        >
		<#list columnList as column>
          <el-table-column align="center" label="${column.dbColumnComment}">
            <template slot-scope="scope">{{ scope.row.${column.javaPropertyName} || '/' }}</template>
          </el-table-column>
        </#list>
          <el-table-column align="center" prop="created_at" label="操作" width="200">
            <template slot-scope="scope">
              <el-button @click="view(scope.row)" type="text" size="small">查看</el-button>
              <el-button @click="edit(scope.row)" type="text" size="small">修改</el-button>
              <el-button @click="deleteIt(scope.row)" type="text" size="small">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <!--分页栏-->
      <el-pagination
        layout="prev, pager, next"
        :current-page="searchForm.currentPage"
        :page-size="page.limit"
        @current-change="pageCurrentChange"
        :total="page.rowCount"
      ></el-pagination>
    </div>
    <!-- 编辑弹出框 -->
    <el-dialog :title="dialogTitle" :visible.sync="editDialogVisible" v-if="editDialogVisible" class="user-d">
      <editDialog :visible.sync="editDialogVisible" @search="search" :params="params"></editDialog>
    </el-dialog>
    <!--详情弹出框  -->
    <el-dialog :title="dialogTitle" :visible.sync="viewDialogVisible" v-if="viewDialogVisible" class="user-d">
      <viewDialog :visible.sync="viewDialogVisible" :params="params"></viewDialog>
    </el-dialog>
  </div>
</template>
<script>
export default {
  components: {
    editDialog: () => import("./component/edit"),
    viewDialog: () => import("./component/view")
  },
  data() {
  	return {
      //字典项
      options: {
    	  
      },  	
      //查询条件
      searchForm:{
          currentPage: 1
      },
      //列表组件
      table:{
        loading:true,
        list:[]
      },
      //分页组件
      page:{
        limit:5,
        rowCount: 0
      },      
      //弹出框
      dialogTitle: "",
      editDialogVisible: false,
      viewDialogVisible: false,
      params: {
        dialogType: "",
        id: ""
      }
      
    };
  },
  created() {},
  mounted() {
    this.list();
  },
  methods: {
    reset() {
      this.$utils.clearObj(this.searchForm);
    },
    search() {
      this.searchForm.currentPage = 1;
      this.list();
    },
    pageCurrentChange(e) {
      this.searchForm.currentPage = e;
      this.list();
    },
    async list() {
      if (this.searchForm.date) {
        this.searchForm.startTime=this.searchForm.date[0];
        this.searchForm.endTime = this.searchForm.date[1];
      }    	
      this.table.loading = true;
      this.searchForm.limit = this.page.limit;
      let res = await this.$api.${simpleBeanName}Page(this.searchForm);
      this.table.list = res.data.dataList;
      this.page.rowCount = res.data.rowCount;
      this.table.loading = false;
    },
    add() {
      this.editDialogVisible = true;
      this.dialogTitle = "新增";
      //子组件取值
      this.params = {
        dialogType: "add",
        id: ""
      };
    },
    edit(e) {
      this.editDialogVisible = true;
      this.dialogTitle = "编辑";
      //子组件取值
      this.params = {
        dialogType: "edit",
        id: e.${idColumn.javaPropertyName}
      };
    },    
    view(e) {
      this.viewDialogVisible = true;
      this.dialogTitle = "详情";
      //子组件取值
      this.params = {
        dialogType: "view",
        id: e.${idColumn.javaPropertyName}
      };
    },
    deleteIt(e) {
      this.$showConfirm("此操作将永久删除该条信息, 是否继续?", async () => {
        let res =await this.$api.${simpleBeanName}Delete({
           ${simpleBeanName}Id: e.${idColumn.javaPropertyName}
        });
        if(res.isSuccess){
          this.$showMessage("删除成功");
          this.list();
        }
      });        
    }
    
  }
};
</script>
<style scoped lang="scss">
</style>
