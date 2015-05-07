//
//  ViewController.m
//  Pubuliu
//
//  Created by 沈红榜 on 15/5/7.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "MRLayout.h"
#import "SHBLayout.h"

@interface ViewController ()<SHBLayoutDelegate>

@end

@implementation ViewController {
    NSMutableArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 200; i++) {
        int count = arc4random() % 5;
        NSString *title = [NSString stringWithFormat:@"%f", pow(10, count)];
        [_dataArray addObject:title];
    }
    
    
}

- (void)btn {
    
//    MRLayout *layout = [[MRLayout alloc] init];
    SHBLayout *layout = [[SHBLayout alloc] init];
    layout.titles = _dataArray;
    layout.listSpace = 20;
    layout.lineSpace = 20;
    layout.padding = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.delegate = self;
    CollectionViewController *collectionView = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    collectionView.titles = _dataArray;
    [self.navigationController pushViewController:collectionView animated:YES];
    
}

- (CGSize)itemSizeInIndexPath:(NSIndexPath *)path {
    CGSize size = CGSizeZero;
    NSString *string = _dataArray[path.row];
    size = [string sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    size = CGSizeMake(size.width, 30);
    
    return size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
