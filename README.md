#LPLayout
##继承于UICollectionViewLayout

###使用方法
```objc
LPLayout *layout = [[LPLayout alloc]init];
layout.roundRadius = 200;
layout.roundCenter = CGPointMake(300, 300);
layout.itemSize = CGSizeMake(100, 100);
//三种分页效果可选，可分别尝试
layout.pagingStyle = LPLayoutPagingStyleSlow;

![Smaller icon](http://ww2.sinaimg.cn/mw690/e265676egw1f606801vwpj20b40jrt9b.jpg)

![Logo](http://ww2.sinaimg.cn/mw690/e265676egw1f606801vwpj20b40jrt9b.jpg)

(http://25.io/mou/Mou_128.png)
