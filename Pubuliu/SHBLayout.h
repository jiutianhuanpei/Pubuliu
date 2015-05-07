//
//  SHBLayout.h
//  Pubuliu
//
//  Created by 沈红榜 on 15/5/7.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SHBLayoutDelegate <NSObject>

- (CGSize)itemSizeInIndexPath:(NSIndexPath *)path;

@end



@interface SHBLayout : UICollectionViewLayout


/**
 *  行距
 */
@property (nonatomic, assign) CGFloat lineSpace;
/**
 *  列距
 */
@property (nonatomic, assign) CGFloat listSpace;
/**
 *  边距
 */
@property (nonatomic, assign) UIEdgeInsets padding;


@property (nonatomic, assign) id<SHBLayoutDelegate> delegate;

@end
