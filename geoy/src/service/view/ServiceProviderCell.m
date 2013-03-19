//
//  ServiceProviderCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceProviderCell.h"
#import "UIImageView+ImageUtil.h"
#import "UITableViewCell+BackgroundUtil.h"
#import "UILabel+LableUtil.h"
@implementation ServiceProviderCell

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
	[self.thumbView addBorder];
	[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height-2, self.nameLabel.bounds.size.width+8, .5)];
	[self addBackground];
}
@end
