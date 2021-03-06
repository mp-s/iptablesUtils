# 利用iptables设置端口转发的shell脚本

**本项目支持转发到ddns域名、支持udp转发，但不支持端口段转发**

很多玩VPS的人都会有设置端口转发、进行中转的需求，在这方面也有若干种方案，比如socat、haproxy、brook等等。他们都有一些局限或者问题，比如socat会爆内存，haproxy不支持udp转发。

我比较喜欢iptables。iptables利用linux的一个内核模块进行ip包的转发，工作在linux的内核态，不涉及内核态和用户态的状态转换，因此可以说是所有端口转发方案中最稳定的。但他的缺点也显而易见：只支持IP、需要输入一大堆参数。本项目就是为了解决这些缺点，让大家能方便快速地使用最快、最稳定的端口转发方案。


## 用法

```shell
wget -qO natcfg.sh https://raw.githubusercontent.com/mp-s/iptablesUtils/master/natcfg.sh && bash natcfg.sh
```

输出如下：

```shell
用途: 便捷的设置iptables端口转发
注意1: 到域名的转发规则在添加后需要等待2分钟才会生效，且在机器重启后仍然有效

你要做什么呢（请输入数字）？Ctrl+C 退出本脚本
1) 增加域名或IP转发      3) 列出所有转发
2) 删除域名或IP转发      4) 查看iptables转发规则
#? 
```

此时按照需要，输入1-4中的任意数字，然后按照提示即可

## 卸载
```shell
bash <(curl -LSs https://raw.githubusercontent.com/mp-s/iptablesUtils/master/dnat-uninstall.sh)
```

## trojan转发

总是有人说，不能转发trojan，这么说的人大部分是证书配置不对。最简单的解决方案是：客户端选择不验证证书。复杂一点是自己把证书和中转机的域名搭配好。

小白记住一句话就好：客户端不验证证书。

-----------------------------------------------------------------------------

## 本fork可能修复了：

1. 规则删不干净的情况——[issue 15](https://github.com/arloor/iptablesUtils/issues/15)
