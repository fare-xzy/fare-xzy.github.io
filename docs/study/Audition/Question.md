# 面试题
1. Java基础。自动拆装箱如何实现，String，StringBuffer，StringBuilder的异同以及各自的实现。
2. JVM基础。JVM的内存模型，常见的垃圾回收算法。
3. 事务ACID，编程时如何保证事务，分布式情况下如何保证事务。
4. 由于分布式相关场景我没有接触过，因此面试官一直诱导我去设计实现一个分布式事务。
5. 数据库乐观锁和悲观锁。如何实现一个乐观锁。
6. 消息队列使用场景，Kafka的架构以及原理。
7. 什么是restful api，和rpc调用有什么区别。
8. 单例的几种写法。volatile关键字有什么作用。
9. 集合类源码。HashMap是如何实现的，扩容的过程，为什么要扩容为2倍。HashMap中的链表替换为数组可以吗？时间复杂度相同吗？
10. 集合类源码。线程安全的HashMap是什么？（HashTable和ConcurrentHashMap）ConcurrentHashMap是如何实现的？（Java7分段锁和Java8的CAS+Lock）和HashTable相比有什么优势？
11. 红黑树的结构，时间复杂度是多少，如何计算的
12. 什么是CAS操作，如何实现一个自定义锁
13. 数据库设计。有一张很大的order表，如何设计能够提升查询效率（同时满足根据买家id和卖家id查询）？
14. 数据隔离级别，脏读幻读。
15. 线程池原理。
16. Synchronized的实现，锁的升级过程。
17. K8s的作用，K8s的底层架构。
18. MySQL用过么？讲一下索引的数据结构，怎么分析查询效率讲了innodb复合索引的b+tree模型，最左匹配原则，查询效率的explain分析
19. redis用过么？redis怎么保证查询速度纯内存操作；单线程多路复用模型；HashMap的数据结构
20. 用过什么消息队列？为什么用RabbitMQ？应用场景有什么？有没有和其他mq作比较用过RabbitMQ；场景：削峰填谷 异步调用 解耦 扩展性；没用过其他mq
21. 项目中做了什么优化讲了下项目中RabbitMQ实现了at least once，包括mq反馈provider，消息持久化，consumer主动反馈mq，线程池消费防止消息积压等
22. 讲一下springmvc的原理我没用过springmvc，之前用的ssh，后来就直接SpringCloud加springboot了。这里凭印象答了一下，注册dispatcherServlet，将request按照url分发给不同的controller处理，controller调用service+dao等处理业务，之后response返回
23. 简单说了下spring如何处理循环引用，其实答ioc和aop更好些
24. 


# 开放性试题
1. 开放式问题。如何设计一个rpc框架。
2. 开放式问题。如何设计一个服务注册中心。