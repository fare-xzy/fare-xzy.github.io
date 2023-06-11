Lombok 框架使用详解
=
* Lombok 引用依赖
```
<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.16.18</version>
    <scope>provided</scope>
</dependency>
```
* Lombok 注解
    * @Setter 
    * @Getter
    * @Data
    * @Log(这是一个泛型注解，具体有很多种形式)
    * @AllArgsConstructor
    * @NoArgsConstructor
    * @EqualsAndHashCode
    * @NonNull
    * @Cleanup
    * @ToString
    * @RequiredArgsConstructor
    * @Value
    * @SneakyThrows
    * @Synchronized
* 注解详情
    * Log（log注解注解在类上，有如下选择可以使用）
    ```
    //@CommonsLog
    private static final org.apache.commons.logging.Log log = org.apache.commons.logging.LogFactory.getLog(LogExample.class);
    //@JBossLog
    private static final org.jboss.logging.Logger log = org.jboss.logging.Logger.getLogger(LogExample.class);
    //@Log
    private static final java.util.logging.Logger log = java.util.logging.Logger.getLogger(LogExample.class.getName());
    //@Log4j
    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(LogExample.class);
    //@Log4j2
    private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager.getLogger(LogExample.class);
    //@Slf4j
    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(LogExample.class);
    //@XSlf4j
    private static final org.slf4j.ext.XLogger log = org.slf4j.ext.XLoggerFactory.getXLogger(LogExample.c
    ```
    * @Setter And @Getter
        * 该注解使用在类或者属性上，该注解可以使用在类上也可以使用在属性上。生成的getter遵循布尔属性的约定。例如：boolean类型的sex,getter方法为isSex而不是getSex
    * @Data
        * 该注解使用在类上，该注解是最常用的注解，它结合了@ToString，@EqualsAndHashCode， @Getter和@Setter。本质上使用@Data注解，类默认@ToString和@EqualsAndHashCode以及每个字段都有@Setter和@getter。该注解也会生成一个公共构造函数，可以将任何@NonNull和final字段作为参数。
          虽然@Data注解非常有用，但是它没有与其他注解相同的控制粒度。@Data提供了一个可以生成静态工厂的单一参数，将staticConstructor参数设置为所需要的名称，Lombok自动生成的构造函数设置为私有，并提供公开的给定名称的静态工厂方法。 
    * @NonNull
        * 该注解使用在属性上，该注解用于属的非空检查，当放在setter方法的字段上，将生成一个空检查，如果为空，则抛出NullPointerException。 
    * @toString
        * 该注解使用在类上，该注解默认生成任何非讲台字段以名称-值的形式输出。
          * 1、如果需要可以通过注释参数includeFieldNames来控制输出中是否包含的属性名称。
          * 2、可以通过exclude参数中包含字段名称，可以从生成的方法中排除特定字段。
          * 3、可以通过callSuper参数控制父类的输出。
    * @EqualsAndHashCode
        * 该注解使用在类上，该注解在类级别注释会同时生成equals和hashCode
    * @AllArgsConstructor
        * 该注解使用在类上，该注解提供一个全参数的构造方法，默认不提供无参构造。
    * @NoArgsConstructor
        * 该注解使用在类上，该注解提供一个无参构造 
    * @RequiredArgsConstructor
        * 该注解使用在类上，使用类中所有带有 @NonNull 注解的或者带有 final 修饰的成员变量生成对应的构造方法。
    * @Value
        * 这个注解用在 类 上，会生成含所有参数的构造方法，get 方法，此外还提供了equals、hashCode、toString 方法。
    * @Cleanup
        * 该注解使用在属性前，该注解是用来保证分配的资源被释放。在本地变量上使用该注解，任何后续代码都将封装在try/finally中，确保当前作用于中的资源被释放。默认@Cleanup清理的方法为close，可以使用value指定不同的方法名称。
    * @Synchronized
        * 该注解使用在类或者实例方法上，Synchronized在一个方法上，使用关键字可能会导致结果和想要的结果不同，因为多线程情况下会出现异常情况。Synchronized
          关键字将在this示例方法情况下锁定当前对象，或者class讲台方法的对象上多锁定。这可能会导致死锁现象。一般情况下建议锁定一个专门用于此目的的独立锁，而不是允许公共对象进行锁定。该注解也是为了达到该目的。 
    * @SneakyThrows
        * 该注解使用在方法上，这个注解用在 方法 上，可以将方法中的代码用 try-catch 语句包裹起来，捕获异常并在 catch 中用 Lombok.sneakyThrow(e) 把异常抛出，可以使用 @SneakyThrows(Exception.class) 的形式指定抛出哪种异常。该注解需要谨慎使用。
    *  
     