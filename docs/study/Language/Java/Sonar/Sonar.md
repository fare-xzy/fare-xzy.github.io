
# Sonar 问题详解

## Blocker
1. Child class fields should not shadow parent class fields
    * 问题：子类不可以private父类的非private方法
2. Resources should be closed
    * 使用try - resources方式关闭流
3. Printf-style format strings should not lead to unexpected behavior at runtime
    * 问题：字符串输出流格式异常
4. Loops should not be infinite
    * 循环不因该是无限的
5. Double-checked locking should not be used
    * 重复检查的锁块不要使用
6. Credentials should not be hard-coded
    * 凭证不应该硬编码
7. 
8. 
9. 
10. 
11. 
12. 
13

## Critical
1. Cognitive Complexity of methods should not be too high
    * 问题：方法的认知复杂度不宜过高（一般为循环判断过多）
    * 解决：降低方法中if else 等复杂度
2. String literals should not be duplicated
    * 问题：字符串不应重复
    * 解决：使用常量接收
3. "static" base class members should not be accessed via derived types
    * 问题：不应通过派生类型访问"静态"基类成员
    * 解决：直接通过基类访问该成员变量
4. "String#replace" should be preferred to "String#replaceAll"
    * 问题：应尽量避免使用replaceAll
5. Persistent entities should not be used as arguments of "@RequestMapping" methods
    * 问题：持久性应用不应用于@RequestMapping的参数
6. Try-with-resources should be used
    * 使用try - resource
7.  “Random” objects should be reused
    * 问题：在意个类的多个方法中使用了Random random = new Random(); 应该重用“随机”对象 随机数种子在创建一个random对象的时候生成，相同 的随机数种子，产生相同随机数的几率非常高
    * 解决：随机数定义为一个属性，然后在下面的方法里面生成随机值
8. Jump statements should not occur in "finally" blocks
    * 跳转连接不应在finally块中
9.
10.
11.
12.
13.
14.
15.

## Major
1. Instance methods should not write to "static" fields
    * 问题：普通方法调用静态属性时，Sonar会认为有问题
    * 例如
    ```
   public class MyClass { 
        private static BeanFactory factory;
        
            /**
             * 获取实体类
             * 
             * @param id
             * @return
             */
            public static <T> T getBean(String id) {
                return (T) factory.getBean(id);
            }
        
            /**
             * 设置bean工厂
             * 
             * @param beanFactory
             */
            @Override
            public void setBeanFactory(BeanFactory beanFactory) {
                BeanHelper.factory = beanFactory;
            }
    }
   ```
   * 解决方法：对静态属性包装一个静态方法
   * 例如：
   ```
   public class MyClass { 
           private static BeanFactory factory;
           
               /**
                * 获取实体类
                * 
                * @param id
                * @return
                */
               public static <T> T getBean(String id) {
                   return (T) factory.getBean(id);
               }
           
               private static void setFactory(BeanFactory factory) {
                   BeanHelper.factory = factory;
               }
           
               /**
                * 设置bean工厂
                * 
                * @param beanFactory
                */
               @Override
               public void setBeanFactory(BeanFactory beanFactory) {
                   setFactory(beanFactory);
               }
       }
   ```
2. Generic exceptions should never be thrown
    * 问题：不要注解使用泛型异常（Exception、RuntimeException）
    * 解决：自己定义异常或者抛出专有异常
3. Deprecated elements should have both the annotation and the Javadoc tag
    * 问题：不推荐使用的元素应具有注释和javadoc标签
4. Unused assignments/methods should be removed
    * 未使用的内容应被删除
5. Printf-style format strings should be used correctly
    * 问题：应正确使用printf样式的格式字符串
6. Fields in a "Serializable" class should either be transient or serializable
    * 问题：可序列化类中的字段应为可序列化或者不被序列化的（transient）
    * 解决：将字段标记为transient，如果遇上泛型，将泛型继承Serializable
7. Sections of code should not be commented out
    * 问题：不要有大量的代码注释块
8. Try-catch blocks should not be nested
    * 问题：try-catch不应该被嵌套。
9. Generic exceptions should never be thrown
    * 问题：通用异常不应抛出
10. Methods and field names should not be the same or differ only by capitalization
    * 类里面的方法和字段名不应该完全相同或者仅大小写不同
11. Asserts should not be used to check the parameters of a public method
    * 问题：断言不应用于检查公共方法的参数
    * 解决：使用if进行判断
12. Raw types should not be used
    * 问题：泛型类型不应该在变量声明或返回值中使用原始(没有类型参数)
    * 解决：声明带类型的参数
13. Anonymous inner classes containing only one method should become lambdas
    * 只包含一个方法的匿名内部类应该写成Lambdas表达式的形式，增强代码可读性
14. Unused assignments should be removedAnimatedGifEncoder
    * 没有被使用的参数因该被移除（视情况而定）
15. Exceptions should be either logged or rethrown but not both
    * 异常应该被记录或者抛出，但不能同时被记录和抛出    存在通过日志将异常打印，同时让异常被其他的进行捕获的场景
16. Assignments should not be made from within sub-expressions
    * 不应在子表达式中作出赋值操作当赋值变量没有用到
17. Identical expressions should not be used on both sides of a binary operator
    * 相同的表达式不要作为二进制操作的操作数使用,应该简化
18. Null pointers should not be dereferenced
    * 对值为null的指针调用任何方法，就会引发空指针异常(java.lang.NullPointerException)。在最好的情况下，这样的异常会导致程序终止。在最坏的情况下，它可能暴露出对攻击者有用的调试信息，或者它可能允许攻击者绕过安全措施
19. Constant names should comply with a naming convention
    * 常数名称应符合命名约定
20. Silly equality checks should not be made
    * 愚蠢的相等检查不应该做，非同类型的对象equal
21. All branches in a conditional structure should not have exactly the same implementation
    * 分支中不应该有相同的实现
22. "toString()" and "clone()" methods should not return null
    * toString和clone方法不因该返回null 可以返回""
23. Raw byte values should not be used in bitwise operations in combination with shifts
    * 原始字节值不应参与位运算 result = (result << 8) | (readByte() & 0xff);
24. Non-serializable classes should not be written
    * 执行写操作的类要序列化，否则会抛出异常
25. 
26. 
27. 
28. 
29. 
30. 
31. 
32. 
33.34.35.36.37.38.39.40.41.42.43.44.45.46.47.48.49.50
23. Constructors should not be used to instantiate "String", "BigInteger", "BigDecimal" and primitive-wrapper classe
    * 构造函数不应用于实例化“ String”，“ BigInteger”，“ BigDecimal”和原始包装器类
    * 因该使用类似BigInteger.valueOf(1)





      

## Minor
1. Boxed "Boolean" should be avoided in boolean expressions
   * 在布尔表达式中应避免使用装箱的“布尔”
    ```
        Boolean b = getBoolean();
        if (b) {  // Noncompliant, 当b为null，回抛NPE
            foo();
        } else {
            bar();
        }
   
        Boolean b = getBoolean();
        if (Boolean.TRUE.equals(b)) { //注意这块写法
            foo();
        } else {
            bar();  // will be invoked for both b == false and b == null
        }
   ```
2. Collection.isEmpty() should be used to test for emptiness
    * 因该使用isEmpty来判断数列是否为空
3. Local variable and method parameter names should comply with a naming convention
    * 局部变量和方法参数名称应符合命名约定
4. The value returned from a stream read should be checked
    * 从流中读取的值应先检查再操作
5. Class variable fields should not have public accessibility
    * 类变量不要设置为public，而是设为private，再提供get和set方法
6.7.8.9.10.11.12.13.14.15.16.17


   