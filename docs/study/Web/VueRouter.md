# VueRouter3.x

### 常用内容

##### 基本配置

```js
const router = new VueRouter({
  routes: [
    {
      path: '/user',
      component: User,
      children: [
        { path: 'profile',name: 'profile', component: () => import('./views/profile.vue') },
        { path: 'posts', component: UserPosts }
      ]
    },
    { path: '/about', component: About },
    // ...
  ]
});
```

##### 使用



```js
// 触发
<router-link to="/">Home</router-link>
// 显示
<router-view></router-view>
// 另外一种方式
router.push('/');

```

##### 进阶

```js
// 动态路由
{ path: '/user/:id', component: User }
```

```js
// 元信息meta
{ path: '/dashboard', component: Dashboard, meta: { requiresAuth: true } }


```



```js
router.beforeEach((to, from, next) => {
    // 在导航之前做一些逻辑处理

    if (/* 条件满足 */) {
        // 允许进入目标路由
        next();
    } else {
        // 中断当前导航，终止进入目标路由
        next(false);
    }
});
```
