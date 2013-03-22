//
//  ServiceIndexViewController.h
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
@interface ServiceIndexViewController : CoreDataTableViewController

- (IBAction)backToRootPageAction:(UIButton *)sender; // 返回home界面
- (IBAction)fetchNewData:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@end
