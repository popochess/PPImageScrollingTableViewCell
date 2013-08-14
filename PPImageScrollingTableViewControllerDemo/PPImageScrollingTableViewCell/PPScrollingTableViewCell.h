//
//  PPScrollingTableViewCell.h
//  PPImageScrollingTableViewControllerDemo
//
//  Created by popochess on 13/8/10.
//  Copyright (c) 2013年 popochess. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPScrollingTableViewCell;

@protocol PPImageScrollingTableViewCellDelegate <NSObject>

- (void)scrollingTableViewCell:(PPScrollingTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSIndexPath*)indexPathOfImage atCategoryRowIndex:(NSInteger)categoryRowIndex;

@end

@interface PPScrollingTableViewCell : UITableViewCell

@property (weak, nonatomic) id<PPImageScrollingTableViewCellDelegate> delegate;
@property (nonatomic) CGFloat height;

- (void) setImageData:(NSDictionary*) image;
- (void) setCollectionViewBackgroundColor:(UIColor*) color;
- (void) setCategoryLabelText:(NSString*)text withColor:(UIColor*)color;
- (void) setImageTitleLabelWitdh:(CGFloat)width withHeight:(CGFloat)height;
- (void) setImageTitleTextColor:(UIColor*)textColor withBackgroundColor:(UIColor*)bgColor;

@end