---
title: 虚拟机性能监控与故障处理工具
date: 2017-07-27 13:38:07
categories:
- Java
tags:
- 学习笔记
---

### JDK 命令行工具
#### jps：虚拟机进程状况工具

列出正在运行的虚拟机进程。

`jps [ option ] [ hostid ]`

| 选项 |  作用  |
| ---- | ------|
| -q   | 只输出LVMID，省略主类的名称 |
| -m   | 输出虚拟机进程启动时传递给主类main()函数的参数 |
| -l   | 输出主类的全名，如果进程执行的是jar包，输出jar路径 |
| -v   | 输出虚拟机进程启动时JVM参数 |

> LVMID，Local Virtual Machine Identifier，与操作系统的进程ID一致。

#### jstat：虚拟机统计信息监视工具

监视虚拟机各种运行状态信息。

`jstat [ option vmid [interval[s|ms] [count]] ]`

`[protocol:][//]lvmid[@hostname[:port]/servername]`

#### jinfo：Java配置信息工具

实时查看和调整虚拟机各项参数。

`jinfo [option] pid`

#### jmap：Java内存映像工具

生成堆转储快照（一般称为headdump或dump）。

`jmap [option] vmid`

#### jhat：虚拟机堆转储快照分析工具

与jmap配合分析jmap生成的堆转储快照。jhat内置一个微型的HTTP/HTML服务器，启动后通过地址`http://localhost:7000`进行查看。

#### jstack：Java堆栈跟踪工具

生成虚拟机当前时刻的线程快照（一般称为threaddump或javacore文件）。

`jstack [option] vmid`

### JDK 可视化工具
#### VisualVM：多合一故障处理工具

VisualVM除了具有监控、管理、性能分析功能之外，还可以通过安装插件进行功能扩展。命令位置：`$JAVA_HOME\bin\jvisualvm`。

Java VisualVM 插件中心已迁移至github，新地址为 https://visualvm.github.io/pluginscenters.html
如果无法安装插件，可以在插件中心选择相应的版本，添加到`工具/插件/设置`中解决。

#### JConsole：Java监视与管理控制台

JConsole 是一种基于JMX的可视化监视、管理工具。可以对内存(jstat)、线程(jstack)进行监控，对JMX MBean进行管理。功能比较简单，实际中一般使用其他工具替代，如VisualVM。命令位置：`$JAVA_HOME\bin\jconsole`。

PS：后续还会进行完善。
> 参考：深入理解Java虚拟机 —— JVM高级特性与最佳实践 第4章
