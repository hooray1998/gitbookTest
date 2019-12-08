# Introduction


![tup](1.jpg)

> [!note]
> An alert of type 'note' using global style 'callout'.

* [动态](README.md#动态规划)

> [!COMMENT]
> An alert of type 'note' using global style 'callout'.

[插件介绍](https://www.jianshu.com/p/427b8bb066e6)

> [!WARNING]
> An alert of type 'note' using global style 'callout'.

[好看的警报]( https://github.com/zanfab/gitbook-plugin-flexible-alerts)
[alerts](https://plugins.gitbook.com/plugin/alerts)
[文字加底色]( https://github.com/GitbookIO/plugin-emphasize)

> [!tip]
> An alert of type 'note' using alert specific style 'flat' which overrides global style 'callout'.

<https://github.com/codeclou/gitbook-plugin-advanced-emoji>
[emoji表情地址](http://www.emoji-cheat-sheet.com/)


> [!NOTE]
> 发生的发生大


:smile:

忽略下面的表情
<!-- ignore:advanced-emoji:start -->
:white_check_mark:
<!-- ignore:advanced-emoji:end -->

foo


*   [ ]  write some articles
*   [x]  drink a cup of tea

```bash
test aa
cp fasd.xml afsd"fa fasd"

```

# 动态规划

-----------------------

## 最长公共子序列

例如: 

1. str1 = "zxyxyz"
2. str2 = "xyzyzx"

最长公共子序列为"xyyz"
推导式：
如果i和j都大于0，那么

- 若ai  = bj, L[i,j] = L[i-1,j-1] + 1
- 若ai != bj, L[i,j] = max(L[i-1,j], L[i,j-1])

```python
str1 = 'zxyxyz'
str2 = 'xyzyzx'
L = []
for i in range(len(str1)+1):
	L.append([0]*(len(str2)+1))
for i,c1 in enumerate(str1): # i和j都是从0开始的，！！！
	for j,c2 in enumerate(str2):
		if c1==c2:
			L[i+1][j+1] = L[i][j] + 1
		else:
			L[i+1][j+1] = max(L[i+1][j],L[i][j+1])
	
print(L)
	
```


## 最大相邻数字和

解题思路：

- 遍历每个数字，把这个数字作为序列的最后一个,不能不要
- 变量sum大于0的时候会一直累加，小于零时置零（丢弃前面所有的数字)

```python
n = [-3,1,4,-5,-1,5,7,-11,3,4,-5,3]
# n = [-3,-1,-4,-5,-1,-5,-7,-11,-3,-4,-5,-3] # 即使全为负数也ok
l = []
sum = 0
for v in n:
	sum += v
	l.append(sum)
	if sum<0:
		sum = 0
	
print(max(l))
```


## 零钱找零

问题描述
>需要找66元的零钱，共有1,2,5,10这几个面额，最少需要几张钞票
思路
>k元找零 等效于 k-1,k-2,k-5,k-10找零里面最小的 再加一

```python
money = [1,2,5,10]
target = 66
l = []
for i in range(target+1):
	l.append(target)

l[0] = 0
for k in range(1,target+1):
	min = target
	for m in money:
		if m<=k:
			if min>l[k-m]:
				min = l[k-m]
		else:
			break
	l[k] = min + 1

print(l[target])
```


## 平方和最小
>12 = 4+4+4 ==>3个数
>13 = 9+4   ==>2个数
思路和上题一致

```python
from math import *
target = 99
money = [ x**2 for x in range(int(sqrt(target)) + 1) ]
print(money)
l = []
for i in range(target+1):
	l.append(target)

l[0] = 0
for k in range(1,target+1):
	min = target
	for m in money:
		if m<=k:
			if min>l[k-m]:
				min = l[k-m]
		else:
			break
	l[k] = min + 1

print(l[target])
```

## 零钱组合问题

>用1,2,5,20,100组成200元，共有多少种组合方式
解法
用1,2,5组成12的方式数量 等于 下面两项之和。

1. 1,2组成12的数量 (不用5的数量)
2. 1,2,5组成7的数量(用5的数量,至少一个)
	- (若用一个5相当于组成7不用5)
	- (若用两个5相当于组成7用一个5)
	- .......
	- 上述所有项相加就是组成7所有的可能

```python
money = [1,2,5,10]
l = []
for i in range(11):
	l.append(0)

l[0] = 1
for m in money:
	for i in range(1,11):
		if m<=i:
			l[i] += l[i-m]

print(l[10])
```


## 最长递增序列

问题
>例如 -3,1,-2,4,5,-6  ===> -3,-2,4,5 (4个)
思路
>外循环下标是i,循环下标是j, j=1->i , 若[j]<[i],且sum[j]+1>sum[i],则更新sum[i]

## 跳楼问题
问题
>某幢大楼有100层。你手里有两颗一模一样的玻璃珠。当你拿着玻璃珠在某一层往下扔的时候，一定会有两个结果，玻璃珠碎了或者没碎。这幢大楼有个临界楼层。低于它的楼层，往下扔玻璃珠，玻璃珠不会碎，等于或高于它的楼层，扔下玻璃珠，玻璃珠一定会碎。玻璃珠碎了就不能再扔。现在让你设计一种方式，使得在该方式下，最坏的情况扔的次数比其他任何方式最坏的次数都少。也就是设计一种最有效的方式。
>例如：有这样一种方式，第一次选择在60层扔，若碎了，说明临界点在60层及以下楼层，这时只有一颗珠子，剩下的只能是从第一层，一层一层往上实验，最坏的情况，要实验59次，加上之前的第一次，一共60次。若没碎，则只要从61层往上试即可，最多只要试40次，加上之前一共需41次。两种情况取最多的那种。故这种方式最坏的情况要试60次。仔细分析一下。如果不碎，我还有两颗珠子，第二颗珠子会从N+1层开始试吗？很显然不会，此时大楼还剩100-N层，问题就转化为100-N的问题了。

那该如何设计方式呢？

根据题意很容易写出状态转移方程：N层楼如果从n层投下玻璃珠，最坏的尝试次数是: max(n, 1 + F(N-n)) eg: N=100,n=60
那么所有层投下的最坏尝试次数的最小值即为问题的解
F(N) = min( max(1, 1 + F(N-1)), max(2, 1 + F(N-2)), max(3, 1 + F(N-3)) .... max(n-1, 1 + F(1))   )
其中F(1)=1


```python
target = 100
f = []
for i in range(target+1):
	f.append(0)
f[1] = 1

for n in range(2,target+1):
	min = target
	for nn in range(1,n):
		max = f[n-nn] + 1
		if max < nn:
			max = nn
		if max < min:
			min = max
	f[n] = min

print(f[target])
```



## 背包问题

```python
weight = [0,3,5,7,8,9]
value = [0,4,6,7,9,10]
maxWeight = 22

# 遍历体积和允许商品数量
a = []
for i in range(23):
    a.append([0,0,0,0,0,0])
for b in range(1,23):
    for w in range(1,6):
        a[b][w] = a[b][w-1]
        if weight[w] <= b:
            if a[b][w] < a[b-weight[w]][w-1]+value[w]:
                a[b][w] = a[b-weight[w]][w-1]+value[w]
print(a)
```


## N×N方格的走法问题
![img](https://images2015.cnblogs.com/blog/461913/201608/461913-20160818235222421-1195816725.png)


```python
dp[i][j] = dp[i][j-1] + dp[i-1][j];
```


> C++代码实现

```cpp
#include<iostream>
#include<vector>
using namespace std;

int main()
{
    int n;
    while (cin >> n)
    {
        vector<vector<int>> dp(n+1, vector<int>(n+1, 1)); //此用法值得学习
        for (int i = 1; i <= n;i++)
        {
            for (int j = 1; j <= n;j++)
            {
                dp[i][j] = dp[i][j - 1] + dp[i - 1][j];
            }
        }
        cout << dp[n][n] << endl;
    }
}
```


## 爬楼梯问题

> 若只允许一次1步，2步，3步三种走法
> n层楼梯的走法等于[n-1] + [n-2] + [n-3]

```python
stairs = 4
a = [0] * (stairs+1)
a[1] = 1
a[2] = 2
a[3] = 4

for i in range(4,stairs+1):
	a[i] = a[i-1] + a[i-2] + a[i-3]
print(a[stairs], ' ways')


```

## 最大子数乘积

>例如：input 10 output 36  for 10=3+3+4 , 36=3*3*4

思路
>f[n] = max( 1*f[n-1], 2*f[n-2], 3*f[n-3]... (n-1)*f[1] )


```python
target = 20
l = [x for x in range(target+1)]
for i in range(3,target+1):
    max = l[i]
    for ii in range(1,i):
        if l[ii]*l[i-ii] > max:
            max = l[ii]*l[i-ii]
    l[i] = max
print(l[target])
```


