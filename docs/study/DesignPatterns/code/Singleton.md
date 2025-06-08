# 单例模式

1. 特点
   1. 单例类只有一个实例对象；
   2. 该单例对象必须由单例类自行创建；
   3. 单例类对外提供一个访问该单例的全局访问点；
2. 结构
   1. 单例类：包含一个实例且能自行创建这个实例的类。
   2. 访问类：使用单例的类。
3. 实现方式
   1. 懒汉式
      1. 懒加载
      2. 线程安全
      3. 这种写法能够很好的在多线程中工作，不会出现并发安全问题，也实现了懒加载。但是效率很低，synchronized使得这里并行变成串行。所以这种写法一般不会被使用到。
      4. [实例](../../../../../../java/java-test/src/main/java/com/xzy/java/designpatterns/singleton/Lazy.java)
   2. 饿汉式
      1. 不懒加载
      2. 线程安全
      3. 它基于 classloader 机制避免了多线程的同步问题，不过，instance 在类装载时就实例化，虽然导致类装载的原因有很多种，在单例模式中大多数都是调用 getInstance 方法， 但是也不能确定有其他的方式（或者其他的静态方法）导致类装载，这时候初始化 instance 显然没有达到 lazy loading 的效果。
      4. [实例](../../../../../../java/java-test/src/main/java/com/xzy/java/designpatterns/singleton/Hungrier.java)