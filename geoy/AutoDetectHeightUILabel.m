//
//  AutoDetectHeightUILabel.m
//  geoy
//
//  Created by Pharaoh on 13-3-18.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "AutoDetectHeightUILabel.h"

@implementation AutoDetectHeightUILabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
	CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.bounds.size.width, 1000) lineBreakMode:self.lineBreakMode];
	return (CGRect){bounds.origin,CGSizeMake(self.bounds.size.width, size.height+6.0f)};
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
