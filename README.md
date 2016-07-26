# 脉脉-无匿名版
脉脉(http://maimai.cn/) 基于人脉的社交平台。
针对脉脉开发一款在匿名区域可以看到实名信息的越狱插件，让人一睹窥看隐私的快感。


# 工具
- Class-dump-z 导出ipa头文件
- Clutch 去壳（脉脉有加壳）破解ipa
- SSH 远程登录
- GDB 远程调试
- Cycript 注入ipa
- Flexloader 越狱后监听https请求和所有相关ipa数据
- Hopper 反汇编静态分析ipa
- Theos 越狱必备 

# 原理
 <strong> 通过动态调试静态分析和网络请求监控找到匿名处理类，然后hook调用其它接口查询出用户信息显示到界面。</strong>

# 教程

1） 设置Theos Tweek

```
$ /opt/theos/bin/nic.pl
NIC 2.0 - New Instance Creator
------------------------------
  [1.] iphone/activator_event
  [2.] iphone/application_modern
  [3.] iphone/cydget
  [4.] iphone/flipswitch_switch
  [5.] iphone/framework
  [6.] iphone/ios7_notification_center_widget
  [7.] iphone/library
  [8.] iphone/notification_center_widget
  [9.] iphone/preference_bundle_modern
  [10.] iphone/tool
  [11.] iphone/tweak   √√√√√√√√√√√
  [12.] iphone/xpc_service
  
```

2） Cluthch去壳，class-dump-z获取脉脉所有头文件 

![](http://7xq9bx.com1.z0.glb.clouddn.com/6808A063-EA16-4D33-BCB1-E9481302B9E2.png?imageView2/1/w/1000/h/300/interlace/0/q/100
)
![](http://7xq9bx.com1.z0.glb.clouddn.com/00B98996-A6F2-422C-AB5E-734B67C7748E.png?imageView2/1/w/1000/h/300/interlace/0/q/100)

3） 静态分析二进制包

![](http://7xq9bx.com1.z0.glb.clouddn.com/7042CE84-5537-4118-AE9B-25A325FFDDFA.png?imageView2/1/w/1000/h/300/interlace/0/q/100)

找到具体函数后，可以查看到https请求地址:

[https://open.taou.com/maimai//user/v4/get\?u2\=3180\&access_token\=2.00pV1TBCc9xsMB2a11f99f30zjQdxD\&version\=4.10.12\&action\=out_date\&channel\=AppStore\&vc\=8.3\&open\=icon\&push_permit\=0\&u\=3180\&appid\=4\&version\=4.10.12\&page\=0\&net\=wifi\&access_token\=2.00pV1TBCc9xsMB2a11f99f30zjQdxD](https://open.taou.com/maimai//user/v4/get\?u2\=3180\&access_token\=2.00pV1TBCc9xsMB2a11f99f30zjQdxD\&version\=4.10.12\&action\=out_date\&channel\=AppStore\&vc\=8.3\&open\=icon\&push_permit\=0\&u\=3180\&appid\=4\&version\=4.10.12\&page\=0\&net\=wifi\&access_token\=2.00pV1TBCc9xsMB2a11f99f30zjQdxD)

access_token 字段到 access_token 是请求必备信息，验证当前请求环境和用户。

![](http://7xq9bx.com1.z0.glb.clouddn.com/2AED7C0D-E889-47A0-A049-C5815CD0C47B.png?imageView2/1/w/1000/h/300/interlace/0/q/100)

4) FlexLoader分析界面和网络请求

截图稍后放出

5）编辑Tweek.mk 文件

在匿名详情界面里每次拿到mmid,查询到当前用户所有信息:

![](http://7xq9bx.com1.z0.glb.clouddn.com/E0F79B90-2139-4B77-AAB9-7865EEC07EB6.png?imageView2/1/w/1000/h/300/interlace/0/q/100)


6) 编译 打包



```

1. make clean

2. make package install

3. 监控日志

```


![](http://7xq9bx.com1.z0.glb.clouddn.com/DA9B017D-1D1D-4FFD-8AE0-4391279B6331.png)

# FAQ

1. 重新打包脉脉-破解版.ipa 并放到蒲公英
2. 重新嵌入查询技巧给自己加影响力
3. 搜索最新匹配职位，主动为自己寻找机会

# 贡献
[nicolastinkl](github.com/nicolastinkl)