Thymeleaf常用语法
=
* 判断是不是为空:null: 
```html
<span th:if="${name} != null">不为空</span> 
<span th:if="${name1} == null">为空</span> 
```
* 判断是不是为空字符串: "" 
```html
<span th:if="${#strings.isEmpty(name1)}">空的</span> 
```
* 判断是否相同：
```html
<span th:if="${name} eq 'jack'">相同于jack,</span> 
<span th:if="${name} eq 'ywj'">相同于ywj,</span> 
<span th:if="${name} ne 'jack'">不相同于jack,</span> 
```
* 不存在设置默认值： 
```html
<span th:text="${name2} ?: '默认值'"></span> 
```
* 是否包含(分大小写): 
```html
<span th:if="${#strings.contains(name,'ez')}">包ez</span> 
<span th:if="${#strings.contains(name,'y')}">包j</span> 
```
* 是否包含（不分大小写） 
```html
<span th:if="${#strings.containsIgnoreCase(name,'y')}">包j</span> 
```
* 同理。。。下面的和JAVA的String基本一样。。。。不笔记解释，官网有
```
${#strings.startsWith(name,'o')} 
${#strings.endsWith(name, 'o')} 
${#strings.indexOf(name,frag)}// 下标 
${#strings.substring(name,3,5)}// 截取 
${#strings.substringAfter(name,prefix)}// 从 prefix之后的一位开始截取到最后,比如 (ywj,y) = wj, 如果是(abccdefg,c) = cdefg//里面有2个c,取的是第一个c 
${#strings.substringBefore(name,suffix)}// 同上，不过是往前截取 
${#strings.replace(name,'las','ler')}// 替换 
${#strings.prepend(str,prefix)}// 拼字字符串在str前面 
${#strings.append(str,suffix)}// 和上面相反，接在后面 
${#strings.toUpperCase(name)} 
${#strings.toLowerCase(name)} 
${#strings.trim(str)} 
${#strings.length(str)} 
${#strings.abbreviate(str,10)}// 我的理解是 str截取0-10位，后面的全部用…这个点代替，注意，最小是3位
```
