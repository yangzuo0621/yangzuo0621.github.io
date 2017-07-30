---
title: Java内存区域
date: 2017-07-30 08:45:20
categories:
- Java
tags:
- 学习笔记
---

> Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。

### 程序计数器

程序计数器的作用主要是为了标识当前线程执行的字节码位置，从而完成分支、循环、跳转、异常处理、线程恢复等功能。`线程私有`。若线程执行的是一个Java方法，其代表了正在执行的虚拟机字节码地址，若线程执行的是一个Native方法，其为空。

### 虚拟机栈

虚拟机栈也是`线程私有`，是Java方法执行的内存模型，每个方法在执行的时候都会创建一个栈帧，用于存储局部变量、操作数栈、动态链接、加载出口等信息，每一个方法的调用，相当于一个栈帧入栈出栈的过程。在栈请求深度超过虚拟机允许的深度时，抛出`StackOverflowError`异常，在无法分配足够的内存区域时，抛出`OutOfMemoryError`异常。

### 本地方法栈

本地方法栈是虚拟机使用Native方法的区域。这意味着调用的方法是与平台相关的，如系统调用等。也是`线程私有`。

### 堆

Java堆是存放对象实例的地方，所有对象实例以及数组都在堆上进行分配，是Java虚拟机管理的内存中最大的一块。为所有`线程共享`。它是垃圾收集器管理的主要区域。当堆中没有内存完成实例分配，且堆无法再扩展时，抛出`OutOfMemoryError`异常。

### 方法区

方法区也是为所有线程共享，它存储已被虚拟机加载的类信息、常量、静态变量、即使编译器编译后的代码等数据。当方法区无法满足内存分配需求时，抛出`OutOfMemorryError`异常。

方法区是一种逻辑上的概念，它的实现依虚拟机的不同有所差异。

JDK1.6及其以前，HotSpot虚拟机将方法区用永久代来实现，带来的问题是更容易遇到内存溢出问题（永久代有-XX:+MaxPermSize上线）。

JDK1.7中，HotSpot虚拟机逐步将方法区从永久代中移除，虽然还有永久代存在，但存储在永久代的部分数据已经转移到了Java Heap或者是 Native Heap。譬如符号引用(Symbols)转移到了native heap；字面量(interned strings)转移到了java heap；类的静态变量(class statics)转移到了java heap。

JDK1.8中，HotSpot虚拟机已完全移除永久代，方法区的实现由`元空间(Metaspace)`代替，这部分内存并不在虚拟机中，直接使用本地内存。常量、静态变量、符号引用在堆中分配，类元数据在本地化内存中分配。



PS：欢迎批评指正。
> 参考：深入理解Java虚拟机 —— Java内存区域与内存溢出异常 第2章