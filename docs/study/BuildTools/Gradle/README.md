# Gradle

## 创建Gradle项目
 * IDEA
 * gradle init（Build Type）
    1. basic 基本的空项目
    2. application 应用程序
    3. Library 库
    4. gradle plugin gradle插件
## Gradle目录结构
 * src 源码目录
 * settings.gradle
 * build.gradle（主要配置你的软件版本信息、引用库的配置,以及编译所需的配置，类似于maven中pom.xml文件）
    * plugins{ id "插件名"}  使用的插件与maven的plugin功能相同
    * repositories 仓库地址
      * 支持的存储库类型
        1. Maven（一个与Maven兼容的工件存储库）
           1. Maven Central
           2. JCenter
           3. …………
           4. 配置方式
              * 远端仓库：
                ```
                repositories {
                   maven {
                       // Look for POMs and artifacts, such as JARs, here
                       url "http://repo2.mycompany.com/maven2"
                       // Look for artifacts here if not found at the above location
                       artifactUrls "http://repo.mycompany.com/jars"
                       artifactUrls "http://repo.mycompany.com/jars2"
                    }
                }
                ```
              * 本地仓库：
                ```
                repositories {
                    mavenLocal()
                }
                ```
                * 优先级：Gradle使用与Maven相同的逻辑来标识本地Maven缓存的位置。如果在中定义了本地存储库位置settings.xml，则将使用该位置。在settings.xml中USER_HOME/.m2优先于settings.xml中M2_HOME/conf。如果没有settings.xml可用的，Gradle将使用默认位置USER_HOME/.m2/repository。
        2. Ivy repositories（常青藤仓库）
           * 配置方式
            * 远端仓库
            ```
           repositories {
               ivy {
                    url "http://repo.mycompany.com/repo"
               }
           }
           ```
           * 本地仓库
            ```
           repositories {
               ivy {
                   // URL can refer to a local directory
                   url "../local-repo"
               }
           }
           ```
        3. local 本地目录
            ```
           repositories {
               flatDir {
                   dirs 'lib'
               }
               flatDir {
                   dirs 'lib1', 'lib2'
               }
           }
           ```
    * dependencies 依赖配置：依赖阶段 group:name:version
        * 举例：
        ```
        betaCompile 'com.github.moduth:blockcanary-ui:1.1.4'
        betaCompile  group: 'com.github.moduth', name: 'blockcanary-ui', version: '1.1.4'  
      ```
        * 依赖阶段：  类似 maven中的scop
            * compile: (已弃用)用于编译和运行时
            * implemention: 用于编译和运行时（新版本取代compile）
            * compileOnly: 仅用作编译阶段使用（用于编译生产代码所必需的依赖关系，但不应该属于运行时类路径的一部分）
            * compileClasspath： 编译类路径，在编译源代码时使用。由任务使用compileJava
            ** annotationProcessor： 编译期间使用的注释处理器
            * runtime:（不建议使用）运行时依赖项
            * runtimeOnly:（取代runtime）仅运行时依赖项
            * runtimeClasspath: 运行时类路径包含实现的元素以及仅运行时元素。
            * testCompile:（不建议使用）编译测试的其他依赖项
            * testImplemention: 仅实现测试的依赖项，相当于 implementation
            * testCompileOnly: 其他依赖项仅用于编译测试，在运行时不使用
            * testCompileClasspath：测试编译类路径，在编译测试源时使用。由任务使用compileTestJava
            * testRuntime：（不建议使用）仅用于运行测试的其他依赖项。
            * testRuntimeOnly : 运行时仅运行测试的依赖项，替代runtimeOnly
            * archives：该项目生产的人工制品
            * default: 项目依赖于此项目的默认配置。包含此项目在运行时所需的工件和依赖项
            * api: 声明API依赖项
            * compileOnlyApi: 声明仅编译API依赖项
            * developmentOnly
    
 * wrapper
