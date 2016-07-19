//
//  LPLayout.m
//
//  Created by iOS on 16/7/5.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "LPLayout.h"

@interface LPLayout ()
{
    NSInteger _itemCount;
    CGPoint _center;
    CGFloat _radius;
}
@end
@implementation LPLayout
- (void)prepareLayout
{
    [super prepareLayout];
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    _center = self.roundCenter;
    _radius = self.roundRadius;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height*10);
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attrsArr = [self attrsArrForVisibleRect:rect forOffset:self.collectionView.contentOffset];
    return attrsArr;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.bounds.size;
    NSArray *attrsArr = [self attrsArrForVisibleRect:rect forOffset:proposedContentOffset];
    
    CGFloat centerY = _center.y + proposedContentOffset.y;
    
    CGFloat gap = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrsArr) {
        if (ABS(gap) > ABS(attr.center.y - centerY)) {
            gap = attr.center.y - centerY;
        }
    }
        
    CGFloat Y = 0.0;
    if (self.pagingStyle == LPLayoutPagingStyleFast || velocity.y == 0) {
        Y = asin(gap/_radius)*(4*_radius)/(2*M_PI);
        Y = ABS(proposedContentOffset.y + Y);
    }
    if (self.pagingStyle == LPLayoutPagingStyleSlow && velocity.y != 0) {
        
        NSInteger multiple = self.collectionView.contentOffset.y/(_radius*4/_itemCount);
        
        if (velocity.y > 0) {
            Y = (_radius*4/_itemCount)*(multiple+1);
        }
        if (velocity.y < 0) {
            Y = (_radius*4/_itemCount)*multiple;
        }
    }
    if (self.pagingStyle == LPLayoutPagingStyleNone) {
        Y = CGFLOAT_MAX;
    }
    
    
    
    
    CGPoint point = CGPointMake(proposedContentOffset.x, Y);
    
    return point;
}
//以下两个为自定义方法
- (NSArray *)attrsArrForVisibleRect:(CGRect)rect forOffset:(CGPoint)offset
{
    NSMutableArray* attrsArr = [NSMutableArray array];
    for (NSInteger i = 0 ; i < _itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath forOffset:offset];
        BOOL isInter = CGRectIntersectsRect(attr.frame, rect);
        if (isInter) [attrsArr addObject:attr];
    }
    return attrsArr;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath forOffset:(CGPoint)offset
{
    CGFloat b = offset.y;
    
    CGFloat angel = M_PI*2/_itemCount;
    CGFloat addAngel = angel*indexPath.row + (2*M_PI)/(4*_radius)*b;
    
    CGFloat x = _center.x - _radius*cos(addAngel);
    CGFloat y = _center.y - _radius*sin(addAngel) + b;
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.center = CGPointMake(x, y);
    attr.size = self.itemSize;
    
    //等比例缩放，不需要可注释
    CGFloat bili = 1 - (_radius - ABS(attr.center.x - _center.x))*0.5/_radius;
    attr.transform = CGAffineTransformMakeScale(bili, bili);
    return attr;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
