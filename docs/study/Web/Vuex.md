# VueX

状态管理

```js
// 在 Vuex 中定义 
const store = new Vuex.Store({
    // 定义
  state: {
    count: 0
  },
    // 获取
  getters: {
    doubleCount: state => state.count * 2
  },
    // 设置
  mutations: {
    increment(state) {
      state.count++;
    }
  },
    // 函数
  actions: {
    incrementAsync(context) {
      setTimeout(() => {
        context.commit('increment');
      }, 1000);
    }
  }
});

// 在组件中使用 getter
computed: {
  doubleCount() {
    return this.$store.getters.doubleCount;
  }
}

methods: {
    increment() {
        this.$store.commit('increment');
    }
}

incrementAsync() {
    this.$store.dispatch('incrementAsync');
}


```




