# TypeScript

## 记录一点点

```typescript
// export 方式
// 基本用法
//A.js
var a1=111
function fn(){
} 
export {a1,fn}


//B.js
import {a1,fn} from './A'
 
console.log(a1)
fn()
```

①默认导出：export default Test(导入时可指定模块任意名称，无需知晓内部真实名称)

②单独导出：export const name = "Bruce"

③按需导出：export { age, name, sex }(推荐)

④改名导出：export { name as newName }

```ts
// ! 非空断言，进行判断
// ? 问号代表参数可以为空
// 例如
interface testA {
    a?: string
}
const aValue = {} as testA

let getb = aValue!.b
```

