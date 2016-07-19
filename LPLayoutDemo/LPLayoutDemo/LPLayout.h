//
//  LPLayout.h
//
//  Created by iOS on 16/7/5.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LPLayoutPagingStyle) {
    LPLayoutPagingStyleNone,
    LPLayoutPagingStyleFast,
    LPLayoutPagingStyleSlow
};
@interface LPLayout : UICollectionViewLayout
@property (nonatomic, assign) CGPoint roundCenter;
@property (nonatomic, assign) CGFloat roundRadius;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) LPLayoutPagingStyle pagingStyle;

@end
