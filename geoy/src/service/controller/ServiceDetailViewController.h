//
//  ServiceDetailViewController.h
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceDetailViewController : UITableViewController
- (IBAction)close:(UIButton*)sender;
- (IBAction)toggleLikedState:(UIButton*)sender;
- (IBAction)toggleOrderState:(UIButton*)sender;

@end
