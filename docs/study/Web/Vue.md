# Vue2

### 创建

```bash
# 安装vue-cli
npm install -g @vue/cli
yarn global add @vue/cli

# 创建项目
vue create hello-world
```

```json
// vue.config.js

module.exports = {
  // 部署应用时的基本 URL
  publicPath: process.env.NODE_ENV === 'production' ? '/production-sub-path/' : '/',

  // 构建时的输出目录
  outputDir: 'dist',

  // 静态资源目录 (js, css, img, fonts)
  assetsDir: 'static',

  // 是否开启eslint保存检测，有效值：true | false | 'error'
  lintOnSave: true,

  // 是否使用包含运行时编译器的Vue核心的构建
  runtimeCompiler: false,

  // Babel配置
  // transpileDependencies: [],

  // 生产环境source map
  productionSourceMap: true,

  // CSS相关配置
  css: {
    // 是否使用css分离插件 ExtractTextPlugin
    extract: true,

    // 开启 CSS source maps?
    sourceMap: false,

    // css预设器配置项
    loaderOptions: {
      css: {},
      sass: {}
    },

    // 启用 CSS modules for all css / pre-processor files.
    modules: false
  },

  // webpack-dev-server配置
  devServer: {
    open: process.platform === 'darwin',
    host: '0.0.0.0',
    port: 8080,
    https: false,
    hotOnly: false,
    // 代理配置
    proxy: {
      '/api': {
        target: '<url>',
        ws: true,
        changeOrigin: true
      }
    },
    // 在服务启动之前执行的自定义函数
    before: app => {}
  },

  // 多页面配置
  pages: {
    index: {
      entry: 'src/main.js',
      template: 'public/index.html',
      filename: 'index.html',
      title: 'Index Page',
      chunks: ['chunk-vendors', 'chunk-common', 'index']
    },
    // 可以在这里添加其他页面的配置
  },

  // eslint-loader配置
  chainWebpack: config => {
    config.module
      .rule('eslint')
      .use('eslint-loader')
      .tap(options => {
        options.fix = true; // 自动修复eslint错误
        return options;
      });
  },

  // 第三方插件配置
  pluginOptions: {
    // ...
  }
};
```

### 生态

- [VueRouter](study/Web/VueRouter.md)

- [Vuex](study/Web/Vuex.md)

- [ Axios](https://axios-http.com/zh/docs/intro)

- [Ant Design Vue (antdv.com)](https://www.antdv.com/components/overview-cn)

- [Element - 网站快速成型工具](https://element.eleme.cn/#/zh-CN)

- [PrimeVUE (primefaces.org)](https://www.primefaces.org/primevue-v2/#/)

### 常用内容

1. 模板语法： {{  }}

2. 计算属性： **`computed`**

3. 监听属性：**`watch`**

4. 响应式变量：**`data`**

5. 属性传递：**`props`** **`provide`** **`inject`**

6. 函数：**`methods`**

7. 生命周期函数：**`created`** **`mounted`** **`destroyed`**

8. 组件注册：**`components`**

9. 全局配置：**`errorHandler`** 

10. 常用指令：
    
    1. **`v-show`** 
    
    2. **`v-if`** 
    
    3. **`v-else`** 
    
    4. **`v-else-if`** 
    
    5. `v-for` 
    
    6. **`v-on`** 
    
    7. **`v-bind`** 
    
    8. **`v-model`** 
    
    9. **`v-slot`** 

11. 元素引用：**`ref`**

12. 插槽：**`slot`**

13. 自定义事件：**`$emit`**

# Vue3

#### 常用内容

1. 获取全局配置

```typescript
// 获取全局配置属性
const instance = getCurrentInstance()
const globalProperties = instance!.appContext.config.globalProperties
```

2. 父组件访问子组件

```typescript
<script lang="ts" setup>
这种方式内部内容为私有，如果需要开放给外部访问需要开放授权

// 暴漏给父组件
defineExpose({
  fileList
})

```