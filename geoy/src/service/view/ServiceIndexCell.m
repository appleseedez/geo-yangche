//
//  ServiceIndexCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceIndexCell.h"
#import "UIImageView+ImageUtil.h"
#import "UITableViewCell+BackgroundUtil.h"
@implementation ServiceIndexCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}


- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self addBackground];
}
@end
