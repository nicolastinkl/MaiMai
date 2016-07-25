# 脉脉-无匿名版
脉脉(http://maimai.cn/) 基于人脉的社交平台。
正对脉脉开发一款在匿名区域可以看到实名信息的越狱插件，让人一睹窥看隐私的快感。


# 工具
- class-dump-z 导出ipa头文件
- Clutch 去壳（脉脉有加壳）破解ipa
- SSH 远程登录
- gdb 远程调试
- cycript 注入ipa
- Flexloader 越狱后监听https请求和所有相关ipa数据
- Hopper 反汇编静态分析ipa
- Thos 越狱必备 

# 原理
 <strong> 通过动态调试静态分析和网络请求监控找到匿名处理类，然后hook调用其它接口查询出用户信息显示到界面。</strong>

# 用法

```

1. make clean

2. make package install

3. 监控日志

```

# FAQ


# 贡献
