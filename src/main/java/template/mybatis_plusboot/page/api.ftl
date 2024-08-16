import { postRequest } from '@/utils/request'

//${config.beanDescription}列表
const ${simpleBeanName}Page = function(params){
    return postRequest('/${simpleBeanName}/page', params)
}

//${config.beanDescription}详情
const ${simpleBeanName}View = function(params){
    return postRequest('/${simpleBeanName}/view', params)
}

//${config.beanDescription}添加
const ${simpleBeanName}Add = function(params){
    return postRequest('/${simpleBeanName}/add', params)
}

//${config.beanDescription}编辑
const ${simpleBeanName}Edit = function(params){
    return postRequest('/${simpleBeanName}/edit', params)
}

//${config.beanDescription}删除
const ${simpleBeanName}Delete = function(params){
    return postRequest('/${simpleBeanName}/delete', params)
}

export default {
    ${simpleBeanName}Page,
    ${simpleBeanName}View,
    ${simpleBeanName}Add,
    ${simpleBeanName}Edit,
    ${simpleBeanName}Delete,
}