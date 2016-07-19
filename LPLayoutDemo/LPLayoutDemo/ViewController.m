//
//  ViewController.m
//  LPLayoutDemo
//
//  Created by iOS on 16/7/19.
//  Copyright © 2016年 iOS. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define ZSRANDOMColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0  blue:arc4random_uniform(255)/255.0  alpha:1]

#import "ViewController.h"
#import "LPLayout.h"
#import "LPCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain) UICollectionView *collection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setCollectionView];
}

- (void)setCollectionView
{
    
    LPLayout *layout = [[LPLayout alloc]init];
    layout.roundRadius = 200;
    layout.roundCenter = CGPointMake(300, 300);
    layout.itemSize = CGSizeMake(100, 100);
    layout.pagingStyle = LPLayoutPagingStyleSlow;
    
    UICollectionView *col = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 600) collectionViewLayout:layout];
    col.center = CGPointMake(SCREEN_WIDTH/2, col.bounds.size.height/2);
    col.backgroundColor = [UIColor greenColor];
    col.delegate = self;
    col.dataSource = self;
    [col registerNib:[UINib nibWithNibName:NSStringFromClass([LPCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:col];
    
    self.collection = col;
    
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(0, 299, SCREEN_WIDTH, 2)];
    vv.backgroundColor = [UIColor redColor];
    [self.view addSubview:vv];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.lab.backgroundColor = ZSRANDOMColor;
    
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
@end
