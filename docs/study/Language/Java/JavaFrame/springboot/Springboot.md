Spring Boot参考指南
----
该文所翻译的内容为Springboot 2.1.2 SNAPSHOT的相关内容

作者  
Phillip Webb，Dave Syer，Josh Long，StéphaneNicoll，Rob Winch，Andy Wilkinson，Marcel Overdijk，Christian Dupuis，SébastienDeleuze，Michael Simons，VedranPavić，Jay Bryant，Madhura Bhave

# 目录
* [第一部分：Springboot文档](#第一部分springboot文档)
    * [1、关于文档](#1)
    * [2、获得帮助](#2)
    * [3、第一步](#3)
    * [4、使用springboot](#4springboot)
    * [5、了解spring-boot的功能](#5spring-boot)
    * [6、生产](#6)
    * [7、高级](#7)
* [第二部分：入门](#第二部分入门)
    * [8、介绍spring-boot](#8spring-boot)
    * [9、servlet容器](#9)
        * [9.1、servlet容器](#91servlet)
    * [10、安装spring-boot](#10spring-boot)
        * [10.1、ava-developer的安装说明](#101java-developer)
            * [10.1.1、maven安装](#1011maven)
            * [10.1.2、gradle安装](#1012gradle)
        * [10.2、安装spring-boot-cli](#102spring-boot-cli)
            * [10.2.1、手动安装](#1021)
            * [10.2.2、使用sdkman安装！](#1022sdkman)
            * [10.2.3、osx-homebrew安装](#1023osx-homebrew)
            * [10.2.4、macports安装](#1024macports)
            * [10.2.5、命令行完成](#1025)
            * [10.2.6、快速启动spring-cli示例](#1026spring-cli)
        * [10.3、从早期版本的spring-boot升级](#103spring-boot)
    * [11、开发您的第一个spring-boot应用程序](#11spring-boot)
        * [11.1、创建pom](#111pom)
        * [11.2、添加classpath依赖项](#112classpath)
        * [11.3、编写代码](#113)
            * [11.3.1、@restcontroller和@requestmapping-annotations](#1131restcontrollerrequestmapping-annotations)
            * [11.3.2、@enableautoconfiguration注释](#1132enableautoconfiguration)
            * [11.3.3、main-方法](#1133main-)
        * [11.4、运行示例](#114)
        * [11.5、创建一个可执行的jar](#115jar)
    * [12、接下来要阅读的内容](#12)  
* [第三部分：使用Spring Boot](#第三部分使用spring-boot)
    * [13、构建系统](#13)
        * [13.1、依赖管理](#131)
        * [13.2、Maven](#132maven)
            * [13.2.1、继承Starter Parent](#1321starter-parent)
            * [13.2.2在没有父POM的情况下使用Spring Boot](#1322pomspring-boot)
            * [13.2.3、使用Spring Boot Maven插件](#1323spring-boot-maven)
# 第一部分Springboot文档
本节简要概述了Spring Boot参考文档。 它用作文档其余部分的映射。

## 1、关于文档
Spring Boot参考指南可用作
* [HTML](https://docs.spring.io/spring-boot/docs/2.1.2.BUILD-SNAPSHOT/reference/html/)
* [PDF](https://docs.spring.io/spring-boot/docs/2.1.2.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf)
* [EPUB](https://docs.spring.io/spring-boot/docs/2.1.2.BUILD-SNAPSHOT/reference/epub/spring-boot-reference.epub)

最新的副本可在[docs.spring.io/spring-boot/docs/current/reference](https://docs.spring.io/spring-boot/docs/current/reference)上找到。

本文档的副本可供您自己使用并分发给他人，前提是您不对此类副本收取任何费用，并且每份副本均包含本版权声明，无论是以印刷版还是电子版分发。

## 2、获得帮助
如果您在使用Spring Boot时遇到问题，我们非常乐意为您提供帮助。

* 尝试[使用方法文档]()。 他们为最常见的问题提供解决方案。

* 学习Spring基础知识。 Spring Boot建立在许多其他Spring项目之上。 查看[spring.io](https://spring.io)网站以获取大量参考文档。 如果您刚开始使用Spring，请尝试其中一个[guides](https://spring.io/guides)。

* 问一个问题。 我们监控[stackoverflow.com](https://stackoverflow.com)以获取用[spring-boot](https://stackoverflow.com/tags/spring-boot)标记的问题。

* 在[github.com/spring-projects/spring-boot/issues](https://github.com/spring-projects/spring-boot/issues)上使用Spring Boot报告错误。

所有Spring Boot都是开源的，包括文档。 如果您发现文档存在问题或想要改进它们，请[参与其中](https://github.com/spring-projects/spring-boot/tree/master)。

## 3、第一步
如果您开始使用Spring Boot或“Spring”，请从以下主题[开始]()：

* 从头开始: [Overview]() | [Requirements]() | [Installation]()
* 教程：[Part 1]() | [Part 2]()
* 举例运行：[Part 1]() | [Part 2]()

## 4、使用SpringBoot
准备好开始使用Spring Boot了吗？ [我们为您提供]()：

* 构建系统：[Maven]() | [Gradle]() | [Ant]() | [Starters]()
* 最佳实践： [Code Structure]() | [@Configuration]() | [@EnableAutoConfiguration]() | [Beans and Dependency Injection]()
* 运行代码: [IDE]() | [Packaged]() | [Maven]() | [Gradle]()
* 打包您的应用程序：[Production jars]()
* Spring Boot CLI：[Using the CLI]()

## 5、了解Spring Boot功能
需要有关Spring Boot核心功能的更多细节？ [以下内容适合您]()：

* 核心功能：[SpringApplication]() | [External Configuration]() | [Profiles]() | [Logging]()
* Web应用程序：[MVC]() | [Embedded Containers]()
* 使用数据：[SQL]() | [NO-SQL]()
* 消息：[Overview]() | [JMS]()
* 测试：[Overview]() | [Boot Applications]() | [Utils]()
* 扩展：[Auto-configuration]() | [@Conditions]()

## 6、生产
当您准备好将Spring Boot应用程序推向生产环境时，我们会提供一些您可能喜欢的[技巧]()：

管理端点：[Overview]() | [Customization]()
连接选项：[HTTP]() | [JMX]()
监控：[Metrics]() | [Auditing]() | [Tracing]() | [Process]()

## 7、高级
最后，我们为更高级的用户提供了一些主题：

* Spring Boot应用程序部署：[Cloud Deployment]() | [OS Service]()
* 构建工具插件：[Maven]() | [Gradle]()
* 附录：[Application Properties]() | [Auto-configuration classes]() | [Executable Jars]()

# 第二部分：入门
如果您开始使用Spring Boot或一般的“Spring”，请首先阅读本节。 它回答了基本的“什么？”，“如何？”和“为什么？”的问题。 它包括Spring Boot简介以及安装说明。 然后，我们将引导您构建您的第一个Spring Boot应用程序，并在我们讨论时讨论一些核心原则。

## 8、介绍Spring Boot
Spring Boot可以轻松创建可以运行的独立的，生产级的基于Spring的应用程序。 我们对Spring平台和第三方库进行了一种自以为是的观点，这样您就可以轻松上手了。 大多数Spring Boot应用程序只需要很少的Spring配置。

您可以使用Spring Boot创建可以使用`java -jar`或更传统的war部署启动的Java应用程序。 我们还提供了一个运行“spring脚本”的命令行工具。

我们的主要目标是：

* 为所有Spring开发提供从根本上更快且可广泛访问的入门体验。
* 开箱即用，但随着需求开始偏离默认值而迅速摆脱困境。
* 提供大型项目（例如嵌入式服务器，安全性，度量标准，运行状况检查和外部化配置）通用的一系列非功能性功能。
* 绝对没有代码生成，也不需要XML配置。

## 9、系统要求
Spring Boot 2.1.2.BUILD-SNAPSHOT需要[Java 8](https://www.java.com/)，并且与Java 11兼容（包括在内）。 还需要[Spring Framework 5.1.4.BUILD-SNAPSHOT](https://docs.spring.io/spring/docs/5.1.4.BUILD-SNAPSHOT/spring-framework-reference/)或更高版本。

为以下构建工具提供了显式构建支持：

|构建工具|版本|
|--------|----|
|Maven|3.3+|
|Gradle|4.4+|

### 9.1、Servlet容器
Spring Boot支持以下嵌入式servlet容器：

|名称|servlet版本|
|----------|---|
|Tomcat 9.0|4.0|
|Jetty 9.4|3.1|
|Undertow 2.0|4.0|
您还可以将Spring Boot应用程序部署到任何Servlet 3.1+兼容容器。

## 10、安装Spring Boot
Spring Boot可以与“经典”Java开发工具一起使用，也可以作为命令行工具安装。 无论哪种方式，您都需要Java SDK v1.8或更高版本。 在开始之前，您应该使用以下命令检查当前的Java安装：
```
$ java -version
```
如果您不熟悉Java开发，或者想要尝试Spring Boot，则可能需要先尝试[Spring Boot CLI]()（命令行界面）。 否则，请继续阅读“经典”安装说明。

### 10.1、Java Developer的安装说明
您可以像使用任何标准Java库一样使用Spring Boot。 为此，请在类路径中包含相应的`spring-boot-*.jar`文件。 Spring Boot不需要任何特殊工具集成，因此您可以使用任何IDE或文本编辑器。 此外，Spring Boot应用程序没有什么特别之处，因此您可以像运行任何其他Java程序一样运行和调试Spring Boot应用程序。

虽然您可以复制Spring Boot jar，但我们通常建议您使用支持依赖关系管理的构建工具（例如Maven或Gradle）。\

#### 10.1.1、Maven安装
Spring Boot与Apache Maven 3.3或更高版本兼容。 如果您还没有安装Maven，可以按照[maven.apache.org](https://maven.apache.org)上的说明进行操作。

在许多操作系统上，Maven可以与软件包管理器一起安装。 如果您使用OSX Homebrew，请尝试`brew install maven`。 Ubuntu用户可以运行`sudo apt-get install maven`。 使用[Chocolatey](https://chocolatey.org/)的Windows用户可以从提升（管理员）提示符运行`choco install maven`。

Spring Boot依赖项使用`org.springframework.boot` `groupId`。 通常，您的Maven POM文件继承自`spring-boot-starter-parent`项目，并声明对一个或多个[“Starters”]()的依赖关系。 Spring Boot还提供了一个可选的[Maven]()插件来创建可执行jar。

以下清单显示了典型的`pom.xml`文件：
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.example</groupId>
	<artifactId>myproject</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<!-- Inherit defaults from Spring Boot -->
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.1.2.BUILD-SNAPSHOT</version>
	</parent>

	<!-- Add typical dependencies for a web application -->
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
	</dependencies>

	<!-- Package as an executable jar -->
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

	<!-- Add Spring repositories -->
	<!-- (you don't need this if you are using a .RELEASE version) -->
	<repositories>
		<repository>
			<id>spring-snapshots</id>
			<url>https://repo.spring.io/snapshot</url>
			<snapshots><enabled>true</enabled></snapshots>
		</repository>
		<repository>
			<id>spring-milestones</id>
			<url>https://repo.spring.io/milestone</url>
		</repository>
	</repositories>
	<pluginRepositories>
		<pluginRepository>
			<id>spring-snapshots</id>
			<url>https://repo.spring.io/snapshot</url>
		</pluginRepository>
		<pluginRepository>
			<id>spring-milestones</id>
			<url>https://repo.spring.io/milestone</url>
		</pluginRepository>
	</pluginRepositories>
</project>
```
`spring-boot-starter-parent`是一种使用Spring Boot的好方法，但它可能并不适合所有时间。 有时您可能需要从其他父POM继承，或者您可能不喜欢我们的默认设置。 在这些情况下，请参见[第13.2.2节]()[“使用不带父POM的Spring Boot”]()作为使用`import`范围的替代解决方案。

#### 10.1.2、Gradle安装
Spring Boot与Gradle 4.4及更高版本兼容。 如果您尚未安装Gradle，则可以按照[gradle.org](https://gradle.org)上的说明进行操作。

可以使用`org.springframework.boot` `group`声明Spring Boot依赖项。 通常，您的项目会声明对一个或多个[“Starters”]()的依赖关系。 Spring Boot提供了一个有用的[Gradle插件]()，可用于简化依赖声明和创建可执行jar。

Gradle Wrapper

当您需要构建项目时，Gradle Wrapper提供了一种“获取”Gradle的好方法。 它是一个小脚本和库，您可以与代码一起提交以引导构建过程。 有关详细信息，请参阅[docs.gradle.org/4.2.1/userguide/gradle_wrapper.html](https://docs.gradle.org/4.2.1/userguide/gradle_wrapper.html)。

有关Spring Boot和Gradle入门的更多详细信息，请参阅Gradle插件参考指南的[“入门”]()部分。

### 10.2、安装Spring Boot CLI
Spring Boot CLI（命令行界面）是一个命令行工具，您可以使用它来快速使用Spring进行原型设计。 它允许您运行[Groovy](http://groovy-lang.org/)脚本，这意味着您拥有熟悉的类似Java的语法，而没有太多的样板代码。

您不需要使用CLI来使用Spring Boot，但它绝对是实现Spring应用程序的最快方法。

#### 10.2.1、手动安装
您可以从Spring软件库下载Spring CLI发行版：

* [spring-boot-cli-2.1.2.BUILD-SNAPSHOT-bin.zip](https://repo.spring.io/snapshot/org/springframework/boot/spring-boot-cli/2.1.2.BUILD-SNAPSHOT/spring-boot-cli-2.1.2.BUILD-SNAPSHOT-bin.zip)
* [spring-boot-cli-2.1.2.BUILD-SNAPSHOT-bin.tar.gz](https://repo.spring.io/snapshot/org/springframework/boot/spring-boot-cli/2.1.2.BUILD-SNAPSHOT/spring-boot-cli-2.1.2.BUILD-SNAPSHOT-bin.tar.gz)

还提供最先进的[快照分发](https://repo.spring.io/snapshot/org/springframework/boot/spring-boot-cli/)

下载完成后，请按照解压缩的存档中的[INSTALL.txt](https://raw.github.com/spring-projects/spring-boot/master/spring-boot-project/spring-boot-cli/src/main/content/INSTALL.txt)说明进行操作。 总之，`.zip`文件中的`bin/`目录中有一个`spring`脚本（用于Windows的`spring.bat`）。 或者，您可以将`java -jar`与`.jar`文件一起使用（该脚本可帮助您确保正确设置类路径）。

#### 10.2.2、使用SDKMAN安装！
SDKMAN！ （软件开发工具包管理器）可用于管理各种二进制SDK的多个版本，包括Groovy和Spring Boot CLI。 获取SDKMAN！ 从[sdkman.io](http://sdkman.io/)中，使用以下命令安装Spring Boot：
```
$ sdk install springboot
$ spring --version
Spring Boot v2.1.2.BUILD-SNAPSHOT
```

如果您为CLI开发功能并希望轻松访问您构建的版本，请使用以下命令：
```
$ sdk install springboot dev /path/to/spring-boot/spring-boot-cli/target/spring-boot-cli-2.1.2.BUILD-SNAPSHOT-bin/spring-2.1.2.BUILD-SNAPSHOT/
$ sdk default springboot dev
$ spring --version
Spring CLI v2.1.2.BUILD-SNAPSHOT
```

前面的说明安装了一个名为`dev`实例的`spring`的本地实例。 它指向您的目标构建位置，因此每次重建Spring Boot时，`spring`都是最新的。

您可以通过运行以下命令来查看它：
```
$ sdk ls springboot

================================================================================
Available Springboot Versions
================================================================================
> + dev
* 2.1.2.BUILD-SNAPSHOT

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================
```

#### 10.2.3、OSX Homebrew安装
如果您使用的是Mac并使用[Homebrew](https://brew.sh/)，则可以使用以下命令安装Spring Boot CLI：

```
$ brew tap pivotal/tap
$ brew install springboot
```
Homebrew将`spring`安装到`/usr/local/bin`。

如果您没有看到公式，那么您的brew安装可能已过时。 在这种情况下，请运行`brew update`并再试一次。

#### 10.2.4、MacPorts安装
如果您使用的是Mac并使用[MacPorts](https://www.macports.org/)，则可以使用以下命令安装Spring Boot CLI：
```
$ sudo port install spring-boot-cli
```

#### 10.2.5、命令行完成
Spring Boot CLI包含为[BASH](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)和[zsh](https://en.wikipedia.org/wiki/Z_shell) shell提供命令完成的脚本。 您可以在任何shell中获取脚本（也称为spring），或者将其放入个人或系统范围的bash完成初始化中。 在Debian系统上，系统范围的脚本位于`/shell-completion/bash`中，当新shell启动时，该目录中的所有脚本都会执行。 例如，要使用SDKMAN！安装，请手动运行脚本，请使用以下命令：
```
$ . ~/.sdkman/candidates/springboot/current/shell-completion/bash/spring
$ spring <HIT TAB HERE>
  grab  help  jar  run  test  version
```
如果使用Homebrew或MacPorts安装Spring Boot CLI，则命令行完成脚本会自动注册到shell。

#### 10.2.6、快速启动Spring CLI示例
您可以使用以下Web应用程序来测试您的安装。 首先，创建一个名为`app.groovy`的文件，如下所示：
```
@RestController
class ThisWillActuallyRun {

	@RequestMapping("/")
	String home() {
		"Hello World!"
	}

}
```
然后从shell运行它，如下所示：
```
$ spring run app.groovy
```
随着依赖项的下载，应用程序的第一次运行速度很慢。 后续运行要快得多。
```
Hello World!
```

### 10.3、从早期版本的Spring Boot升级
如果要从早期版本的Spring Boot升级，请查看项目Wiki上的[“迁移指南”](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0-Migration-Guide)，其中提供了详细的升级说明。 另请查看[“发行说明”](https://github.com/spring-projects/spring-boot/wiki)，了解每个版本的“新的和值得注意的”功能列表。

升级到新功能版本时，某些属性可能已重命名或删除。 Spring Boot提供了一种在启动时分析应用程序环境和打印诊断的方法，还可以在运行时临时迁移属性。 要启用该功能，请将以下依赖项添加到项目中：

```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-properties-migrator</artifactId>
	<scope>runtime</scope>
</dependency>
```
添加到环境后期的属性（例如使用`@PropertySource`时）将不会被考虑在内。

完成迁移后，请确保从项目的依赖项中删除此模块。

要升级现有CLI安装，请使用相应的软件包管理器命令（例如，`brew upgrade`），或者，如果手动安装CLI，请按照[标准说明]()操作，记住更新`PATH`环境变量以删除任何旧引用。

## 11、开发您的第一个Spring Boot应用程序
本节介绍如何开发一个简单的“Hello World！”Web应用程序，该应用程序突出了Spring Boot的一些主要功能。 我们使用Maven来构建这个项目，因为大多数IDE都支持它。

[spring.io](https://spring.io/)网站包含许多使用Spring Boot的“入门”[指南](https://spring.io/guides)。 如果您需要解决特定问题，请先检查一下。

您可以通过转到[start.spring.io](https://start.spring.io/)并从依赖关系搜索器中选择“Web”启动器来快捷执行以下步骤。 这样做会生成一个新的项目结构，以便您可以立即[开始编码]()。 有关更多详细信息，请查看S[pring Initializr](https://docs.spring.io/initializr/docs/current/reference/htmlsingle/#user-guide)文档。

在开始之前，打开终端并运行以下命令以确保安装了有效的Java和Maven版本：
```
$ java -version
java version "1.8.0_102"
Java(TM) SE Runtime Environment (build 1.8.0_102-b14)
Java HotSpot(TM) 64-Bit Server VM (build 25.102-b14, mixed mode)
```
```
$ mvn -v
Apache Maven 3.5.4 (1edded0938998edf8bf061f1ceb3cfdeccf443fe; 2018-06-17T14:33:14-04:00)
Maven home: /usr/local/Cellar/maven/3.3.9/libexec
Java version: 1.8.0_102, vendor: Oracle Corporation
```
此示例需要在其自己的文件夹中创建。 后续说明假定您已创建合适的文件夹，并且它是您当前的目录。

### 11.1、创建POM
我们需要从创建Maven `pom.xml`文件开始。 `pom.xml`是用于构建项目的配方。 打开您喜欢的文本编辑器并添加以下内容：
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.example</groupId>
	<artifactId>myproject</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.1.2.BUILD-SNAPSHOT</version>
	</parent>

	<!-- Additional lines to be added here... -->

	<!-- (you don't need this if you are using a .RELEASE version) -->
	<repositories>
		<repository>
			<id>spring-snapshots</id>
			<url>https://repo.spring.io/snapshot</url>
			<snapshots><enabled>true</enabled></snapshots>
		</repository>
		<repository>
			<id>spring-milestones</id>
			<url>https://repo.spring.io/milestone</url>
		</repository>
	</repositories>
	<pluginRepositories>
		<pluginRepository>
			<id>spring-snapshots</id>
			<url>https://repo.spring.io/snapshot</url>
		</pluginRepository>
		<pluginRepository>
			<id>spring-milestones</id>
			<url>https://repo.spring.io/milestone</url>
		</pluginRepository>
	</pluginRepositories>
</project>
```
上面的清单应该为您提供有效的构建。 您可以通过运行`mvn package`来测试它（现在，您可以忽略““jar will be empty - no content was marked for inclusion!(jar将为空 - 没有内容被标记为包含！)”警告）。

此时，您可以将项目导入IDE（大多数现代Java IDE包括对Maven的内置支持）。 为简单起见，我们继续为此示例使用纯文本编辑器。

### 11.2、添加Classpath依赖项
Spring Boot提供了许多“Starters”，可以将jar添加到类路径中。 我们的示例应用程序已经在POM的父节中使用了`spring-boot-starter-parent`。 `spring-boot-starter-parent`是一个特殊的启动器，提供有用的Maven默认值。 它还提供了一个[dependency-management]()部分，以便您可以省略“祝福”依赖项的`version`标记。

其他“Starters”提供了在开发特定类型的应用程序时可能需要的依赖项。 由于我们正在开发Web应用程序，因此我们添加了`spring-boot-starter-web`依赖项。 在此之前，我们可以通过运行以下命令来查看当前的内容：
```
$ mvn dependency:tree

[INFO] com.example:myproject:jar:0.0.1-SNAPSHOT
```
`mvn dependency：tree`命令打印项目依赖项的树表示。 您可以看到`spring-boot-starter-parent`本身不提供依赖关系。 要添加必要的依赖项，请编辑`pom.xml`并在父节下面添加`spring-boot-starter-web`依赖项：
```
<dependencies>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
</dependencies>
```
如果再次运行`mvn dependency：tree`，您会看到现在有许多其他依赖项，包括Tomcat Web服务器和Spring Boot本身。

### 11.3、编写代码
要完成我们的应用程序，我们需要创建一个Java文件。 默认情况下，Maven从`src/main/java`编译源代码，因此您需要创建该文件夹结构，然后添加名为`src/main/java/Example.java`的文件以包含以下代码：
```
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
public class Example {

	@RequestMapping("/")
	String home() {
		return "Hello World!";
	}

	public static void main(String[] args) {
		SpringApplication.run(Example.class, args);
	}

}
```
虽然这里的代码不多，但还是有很多代码。 我们将在接下来的几节中逐步介绍重要部分。

#### 11.3.1、@RestController和@RequestMapping Annotations
我们的`Example`类的第一个注解是`@RestController`。 这被称为构造型注解。 它为阅读代码的人提供了提示，而对于Spring，该类扮演着特定的角色。 在这种情况下，我们的类是一个Web `@Controller`，所以Spring在处理传入的Web请求时会考虑它。

`@RequestMapping`注解提供“路由”信息。 它告诉Spring，任何带有`/`路径的HTTP请求都应该映射到home方法。 `@RestController`注解告诉Spring将结果字符串直接渲染回调用者。

`@RestController`和`@RequestMapping`注解是Spring MVC注解。 （它们不是特定于Spring Boot的。）有关更多详细信息，请参阅Spring参考文档中的[MVC部分](https://docs.spring.io/spring/docs/5.1.4.RELEASE/spring-framework-reference/web.html#mvc)。

#### 11.3.2、@EnableAutoConfiguration注释
第二个类级别注释是`@EnableAutoConfiguration`。 这个注释告诉Spring Boot根据你添加的jar依赖关系“猜测”你想要如何配置Spring。 由于`spring-boot-starter-web`添加了Tomcat和Spring MVC，因此自动配置假定您正在开发Web应用程序并相应地设置Spring。

```
启动器和自动配置

自动配置旨在与“启动器”配合使用，但这两个概念并不直接相关。 您可以自由选择并在首发之外选择jar依赖项。 Spring Boot仍然尽力自动配置您的应用程序。
```

#### 11.3.3、Main 方法
我们的应用程序的最后一部分是`main`方法。 这只是遵循应用程序入口点的Java约定的标准方法。 我们的main方法通过调用`run`来委托Spring Boot的`SpringApplication`类。 `SpringApplication`引导我们的应用程序，启动Spring，然后启动自动配置的Tomcat Web服务器。 我们需要将`Example.class`作为参数传递给`run`方法，以告诉`SpringApplication`是主要的Spring组件。 `args`数组也被传递以暴露任何命令行参数。

### 11.4、运行示例
此时，您的应用程序应该工作。 由于您使用了`spring-boot-starter-parent` POM，因此您可以使用一个有用的运行目标来启动应用程序。 键入`mvn spring-boot：run`从根项目目录运行以启动应用程序。 您应该看到类似于以下内容的输出：
```
$ mvn spring-boot:run

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::  (v2.1.2.BUILD-SNAPSHOT)
....... . . .
....... . . . (log output here)
....... . . .
........ Started Example in 2.222 seconds (JVM running for 6.514)
```
如果您将Web浏览器打开到localhost：8080，您应该看到以下输出：
```
Hello World!
```
要正常退出应用程序，请按ctrl-c。

### 11.5、创建一个可执行的Jar
我们通过创建一个完全自包含的可执行jar文件来完成我们的示例，我们可以在生产中运行它。 可执行jar（有时称为“fat jar”）是包含已编译类以及代码需要运行的所有jar依赖项的归档。

可执行的jar和Java

Java没有提供加载嵌套jar文件的标准方法（jar文件本身包含在jar中）。 如果您要分发自包含的应用程序，这可能会有问题。

为了解决这个问题，许多开发人员使用“uber” jars。 uber jar将所有应用程序依赖项中的所有类打包到一个存档中。 这种方法的问题在于很难看出应用程序中有哪些库。 如果在多个罐子中使用相同的文件名（但具有不同的内容），也可能会有问题。

Spring Boot采用[不同的方法](https://docs.spring.io/spring-boot/docs/2.1.2.BUILD-SNAPSHOT/reference/htmlsingle/#executable-jar)，让你直接嵌套jar。

要创建可执行jar，我们需要将`spring-boot-maven-plugin`添加到我们的`pom.xml`中。 为此，请在`dependencies`部分下方插入以下行：
```
<build>
	<plugins>
		<plugin>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-maven-plugin</artifactId>
		</plugin>
	</plugins>
</build>
```
`spring-boot-starter-parent` POM包含`<executions>`配置以绑定`repackage`目标。 如果您不使用父POM，则需要自己声明此配置。 有关详细信息，请参阅[插件文档](https://docs.spring.io/spring-boot/docs/2.1.2.BUILD-SNAPSHOT/maven-plugin/usage.html)。

保存`pom.xml`并从命令行运行`mvn package`，如下所示：
```
$ mvn package

[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building myproject 0.0.1-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] .... ..
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ myproject ---
[INFO] Building jar: /Users/developer/example/spring-boot-example/target/myproject-0.0.1-SNAPSHOT.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.2.BUILD-SNAPSHOT:repackage (default) @ myproject ---
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```
如果查看目标目录，则应该看到`myproject-0.0.1-SNAPSHOT.jar`。 该文件大小应为10 MB左右。 如果你想窥视内部，你可以使用`jar tvf`，如下所示：
```
jar tvf target/myproject-0.0.1-SNAPSHOT.jar
```
您还应该在`target`目录中看到名为`myproject-0.0.1-SNAPSHOT.jar.original`的小得多的文件。 这是Maven在Spring Boot重新打包之前创建的原始jar文件。

要运行该应用程序，请使用`java -jar`命令，如下所示：
```
$ java -jar target/myproject-0.0.1-SNAPSHOT.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::  (v2.1.2.BUILD-SNAPSHOT)
....... . . .
....... . . . (log output here)
....... . . .
........ Started Example in 2.536 seconds (JVM running for 2.864)
```
和以前一样，要退出应用程序，请按ctrl-c。

## 12、接下来要阅读的内容
希望本节提供了一些Spring Boot基础知识，让您开始编写自己的应用程序。 如果您是面向任务的开发人员类型，您可能希望跳转到[spring.io](https://spring.io/)并查看一些[入门指南](https://spring.io/guides/)，这些指南解决了特定的“我如何使用Spring？”问题。 我们还有特定于Spring Boot的[“操作方法”]()参考文档。

[Spring Boot存储库](https://github.com/spring-projects/spring-boot)还有[一堆可以运行](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples)的示例。 样本独立于其余代码（也就是说，您无需构建其余代码来运行或使用示例）。

否则，下一个逻辑步骤是阅读[第III部分“使用Spring Boot”]()。 如果你真的很不耐烦，你也可以跳过去阅读有关[Spring Boot功能]()的内容。

# 第三部分:使用Spring Boot
本节详细介绍了如何使用Spring Boot。 它涵盖了构建系统，自动配置以及如何运行应用程序等主题。 我们还介绍了一些Spring Boot最佳实践。 虽然Spring Boot没有什么特别之处（它只是你可以使用的另一个库），但有一些建议，如果遵循这些建议，可以使您的开发过程更容易一些。

如果您刚开始使用Spring Boot，那么在深入了解本节之前，您应该阅读[入门指南](../part2/Part%20II.%20Getting%20Started.md)。

## 13、构建系统
强烈建议您选择支持依赖关系管理且可以使用发布到“Maven Central”存储库的工件的构建系统。 我们建议您选择Maven或Gradle。 可以让Spring Boot与其他构建系统（例如Ant）一起工作，但它们并没有得到特别好的支持。

### 13.1、依赖管理
每个版本的Spring Boot都提供了它支持的依赖项的精选列表。 实际上，您不需要为构建配置中的任何这些依赖项提供版本，因为Spring Boot会为您管理这些依赖项。 当您升级Spring Boot时，这些依赖项也会以一致的方式升级。

如果需要，您仍然可以指定版本并覆盖Spring Boot的建议。

精选列表包含可以与Spring Boot一起使用的所有spring模块以及精确的第三方库列表。 该列表可作为标准的[材料清单]()（spring-boot-dependencies）提供，可与[Maven]()和[Gradle]()一起使用。

每个版本的Spring Boot都与Spring Framework的基本版本相关联。 我们强烈建议您不要指定其版本。

### 13.2、Maven
Maven用户可以继承`spring-boot-starter-parent`项目以获得合理的默认值。父项目提供以下功能：

Java 1.8作为默认编译器级别。

UTF-8源编码。

继承自spring-boot-dependencies pom的[依赖关系管理部分](#131)，用于管理公共依赖关系的版本。此依赖关系管理允许您在自己的pom中使用时省略这些依赖项的<version>标记。

使用`repackage`执行ID执行`repackage`目标。

明智的[资源过滤](https://maven.apache.org/plugins/maven-resources-plugin/examples/filter.html)。

明智的插件配置（[exec插件](http://www.mojohaus.org/exec-maven-plugin/)，[Git提交ID](https://github.com/ktoso/maven-git-commit-id-plugin)和[阴影](https://maven.apache.org/plugins/maven-shade-plugin/)）

`application.properties`和`application.yml`的合理资源过滤，包括特定于配置文件的文件（例如，`application-dev.properties`和`application-dev.yml`）

请注意，由于`application.properties`和`application.yml`文件接受Spring样式占位符（`$ {...}`），因此Maven过滤更改为使用`@ .. @`占位符。 （您可以通过设置名为`resource.delimiter`的Maven属性来覆盖它。）

#### 13.2.1、继承Starter Parent
要将项目配置为继承`spring-boot-starter-parent`，请parent按如下所示进行设置 

    ```<！ - 继承默认值为Spring Boot  - > 
    <parent> 
        <groupId> org.springframework.boot </ groupId> 
        <artifactId> spring-boot-starter-parent </ artifactId> 
        <version> 2.1.3.RELEASE < / version> 
    </ parent>```
您应该只需要在此依赖项上指定Spring Boot版本号。如果导入其他启动器，则可以安全地省略版本号。

通过该设置，您还可以通过覆盖自己项目中的属性来覆盖单个依赖项。例如，要升级到另一个Spring Data版本系列，您需要将以下内容添加到`pom.xml`：

    ```
    <properties> 
        <spring-data- releasetrain.version>
            Fowler-SR2 
        </spring-data-releasetrain.version> 
    </ properties>
    ```
检查 `spring-boot-dependencies`[pom](https://github.com/spring-projects/spring-boot/tree/v2.1.3.RELEASE/spring-boot-project/spring-boot-dependencies/pom.xml) 以获取支持的属性列表。

#### 13.2.2在没有父POM的情况下使用Spring Boot
不是每个人都喜欢从`spring-boot-starter-parent`POM 继承。您可能拥有自己需要使用的公司标准父级，或者您可能更愿意明确声明所有Maven配置。

如果您不想使用`spring-boot-starter-parent`，您仍然可以通过使用`scope=import`依赖项来保持依赖项管理（但不是插件管理）的好处 ，如下所示：

```
<dependencyManagement> 
		<dependencies> 
		<dependency> 
			<！ - 从Spring Boot导入依赖关系管理 - > 
			<groupId> org.springframework.boot </ groupId> 
			<artifactId> spring-boot-dependencies </ artifactId> 
			<version> 2.1 .3.RELEASE </ version> 
			<type> pom </ type> 
			<scope> import </ scope> 
		</ dependency> 
	</ dependencies> 
</ dependencyManagement>
```

如上所述，前面的示例设置不允许您使用属性覆盖单个依赖项。要获得相同的结果，您需要在输入之前在`dependencyManagement`项目中添加一个 条目。例如，要升级到另一个Spring Data版本系列，您可以将以下元素添加到：`spring-boot-dependencies``pom.xml`PS: 重点是在spring-boot-dependencies

```
<dependencyManagement> 
	<dependencies> 
		<！ - 覆盖Spring Boot提供的Spring Data版本系列 - > 
		<dependency> 
			<groupId> org.springframework.data </ groupId> 
			<artifactId> spring-data-releasetrain </ artifactId> 
			< version> Fowler-SR2 </ version> 
			<type> pom </ type> 
			<scope> import </ scope> 
		</ dependency> 
		<dependency> 
			<groupId> org.springframework.boot </ groupId> 
			<artifactId> spring-boot -dependencies </ artifactId> 
			<version>2.1.3.RELEASE </ version> 
			<type> pom</ type> 
			<scope> import </ scope> 
		</ dependency> 
	</ dependencies> 
</ dependencyManagement>
```
在前面的示例中，我们指定了BOM，但是可以以相同的方式覆盖任何依赖关系类型。

#### 13.2.3、使用Spring Boot Maven插件
Spring Boot包含一个[Maven插件]()，可以将项目打包为可执行jar。`<plugins>`如果要使用它，请将插件添加到您的 部分，如以下示例所示:

```
<build> 
	<plugins> 
		<plugin> 
			<groupId> org.springframework.boot </ groupId> 
			<artifactId> spring-boot-maven-plugin </ artifactId> 
		</ plugin> 
	</ plugins> 
</ build>
```
如果使用Spring Boot启动程序父pom，则只需添加插件。除非您要更改父级中定义的设置，否则无需对其进行配置。

### 13.3、 Gradle
要了解如何将Spring Boot与Gradle一起使用，请参阅Spring Boot的Gradle插件的文档：

* 参考（[HTML](https://docs.spring.io/spring-boot/docs/2.1.3.RELEASE/gradle-plugin/reference/html)和 [PDF](https://docs.spring.io/spring-boot/docs/2.1.3.RELEASE/gradle-plugin/reference/pdf/spring-boot-gradle-plugin-reference.pdf)）
* [API](https://docs.spring.io/spring-boot/docs/2.1.3.RELEASE/gradle-plugin/api)

### 13.4、Ant

可以使用Apache Ant + Ivy构建Spring Boot项目。该 `spring-boot-antlib`“的antlib”模块还可以帮助蚂蚁创建可执行的JAR文件。

要声明依赖项，典型`ivy.xml`文件类似于以下示例：

```
<ivy-module  version = “2.0” > 
	<info  organization = “org.springframework.boot”  module = “spring-boot-sample-ant” /> 
	<configurations> 
		<conf  name = “compile”  description = “所需的一切编译此模块“ /> 
		<conf  name = ”runtime“  extends = ”compile“  description = ”运行此模块所需的一切“ /> 
	</ configurations> 
	<dependencies> 
		<依赖 org =“org.springframework.boot”  name = “spring-boot-starter” 
			rev = “$ {spring-boot.version}”  conf = “compile” /> 
	</ dependencies> 
</ ivy-module>
```
典型`build.xml`看起来像以下示例：
```
<project 
	xmlns：ivy = “antlib：org.apache.ivy.ant” 
	xmlns：spring-boot = “antlib：org.springframework.boot.ant” 
	name = “myapp”  default = “build” >

	<property  name = “spring-boot.version”  value = “2.1.3.RELEASE” />

	<target  name = “resolve”  description = “ - >使用常春藤检索依赖关系” > 
		<ivy：retrieve  pattern = “lib / [conf] / [artifact]  -  [type]  -  [revision]。[ext]” /> 
	</目标>

	<target  name = “classpaths”  depends = “resolve” > 
		<path  id = “compile.classpath” > 
			<fileset  dir = “lib / compile”  includes = “* .jar” /> 
		</ path> 
	</ target>

	<target  name = “init”  depends = “classpaths” > 
		<mkdir  dir = “build / classes” /> 
	</ target>

	<target  name = “compile”  depends = “init”  description = “compile” > 
		<javac  srcdir = “src / main / java”  destdir = “build / classes”  classpathref = “compile.classpath” /> 
	</ target>

	<target  name = “build”  depends = “compile” > 
		<spring-boot：exejar  destfile = “build / myapp.jar”  classes = “build / classes” > 
			<spring-boot：lib> 
				<fileset  dir = “lib / runtime“ /> 
			</ spring-boot：lib> 
		</ spring-boot：exejar> 
	</ target> 
</ project>
```

如果您不想使用该`spring-boot-antlib`模块，请参见 [第91.9节“从Ant构建可执行文件而不使用spring-boot-antlib” “操作方法”]()。

### 13.5、初学者
启动器是一组方便的依赖关系描述符，您可以在应用程序中包含这些描述符。您可以获得所需的所有Spring和相关技术的一站式服务，而无需查看示例代码和复制粘贴依赖描述符的负载。例如，如果要开始使用Spring和JPA进行数据库访问，请`spring-boot-starter-data-jpa`在项目中包含依赖项。

启动器包含许多依赖项，这些依赖项是使项目快速启动和运行所需的依赖项，以及一组受支持的托管传递依赖项。

```
什么是名字

所有官方首发都遵循类似的命名模式; spring-boot-starter-*，哪里*是特定类型的应用程序。此命名结构旨在帮助您找到启动器。许多IDE中的Maven集成允许您按名称搜索依赖项。例如，安装了适当的Eclipse或STS插件后，您可以ctrl-space在POM编辑器中输入“spring-boot-starter”以获取完整列表。

正如“ 创建自己的初学者 ”一节中所述，第三方启动者不应该开头spring-boot，因为它是为官方Spring Boot工件保留的。相反，第三方启动器通常以项目名称开头。例如，thirdpartyproject通常会命名一个名为的第三方启动项目 thirdpartyproject-spring-boot-starter。
```
以下应用程序启动程序由Spring Boot在`org.springframework.boot`组下提供 ：

表13.1。Spring Boot应用程序启动器

| Name | Description |
| ---- | ----------- |
| spring-boot-starter | 核心启动器，包括自动配置支持，日志记录和YAML |
| spring-boot-starter-activemq |  |





#### 49.3.3 Property Conditions

`@ConditionalOnProperty`注释允许基于Spring Environment属性包含配置。 使用prefix和name属性指定应检查的属性。 默认情况下，匹配存在且不等于false的任何属性。 您还可以使用havingValue和matchIfMissing属性创建更高级的检查。

