//
//  ServiceProfileCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-18.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceProfileCell.h"
#import "UILabel+LableUtil.h"
#import "UIImageView+ImageUtil.h"
#import "UITableViewCell+BackgroundUtil.h"
@implementation ServiceProfileCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self addBackground];
	[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height+4, self.nameLabel.bounds.size.width, .5)];
	
}
@end
