#LPLayout
##继承于UICollectionViewLayout
- 类似于轮盘一样的效果，可以上下滑动进行分页，也可以取消分页效果一直转圈
###使用方法
```objc
LPLayout *layout = [[LPLayout alloc]init];
layout.roundRadius = 200;
layout.roundCenter = CGPointMake(300, 300);
layout.itemSize = CGSizeMake(100, 100);
//三种分页效果可选，可分别尝试
layout.pagingStyle = LPLayoutPagingStyleSlow;
```

![image](http://ww2.sinaimg.cn/mw690/e265676egw1f606801vwpj20b40jrt9b.jpg)

