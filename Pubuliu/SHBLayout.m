//
//  SHBLayout.m
//  Pubuliu
//
//  Created by 沈红榜 on 15/5/7.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBLayout.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width


@interface SHBLayout ()

@property (nonatomic, strong) NSMutableArray *atts;

@end

@implementation SHBLayout {
    CGFloat maxX;
    CGFloat maxY;
    CGFloat HEIGHT;
}

- (void)prepareLayout {
    [self goBySelf];
    
    [super prepareLayout];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:att];
    }
    self.atts = [array copy];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.atts;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
 
    CGSize size = [self.delegate itemSizeInIndexPath:indexPath];

    if (maxX + _listSpace + size.width < WIDTH - _padding.right) {
        if (maxX == 0) {
            att.frame = CGRectMake(_padding.left, maxY, size.width, size.height);
            maxX = _padding.left + size.width;
        } else {
            att.frame = CGRectMake(maxX + _listSpace, maxY, size.width, size.height);
            maxX = maxX + _listSpace + size.width;
        }
    } else {
        maxY += (size.height + _lineSpace);
        maxX = _padding.left + size.width;
        att.frame = CGRectMake(_padding.left, maxY, size.width, size.height);
    }
    HEIGHT = maxY + size.height + _padding.bottom;
    return att;
}

- (CGSize)collectionViewContentSize {
    CGSize size = CGSizeZero;
    size = CGSizeMake(WIDTH, HEIGHT);
    return size;
}

- (NSMutableArray *)atts {
    if (!_atts) {
        _atts = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _atts;
}

- (CGFloat)lineSpace {
    if (_lineSpace <= 0.1) {
        _lineSpace = 10;
    }
    [self invalidateLayout];
    return _lineSpace;
}

- (CGFloat)listSpace {
    if (_listSpace <= 0.1) {
        _listSpace = 10;
    }
    [self invalidateLayout];
    return _listSpace;
}

- (UIEdgeInsets)padding {
    if (UIEdgeInsetsEqualToEdgeInsets(_padding, UIEdgeInsetsZero)) {
        _padding = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    [self invalidateLayout];
    return _padding;
}

#pragma mark - 自动运行
- (void)goBySelf {
    [self lineSpace];
    [self listSpace];
    [self padding];
}

@end
