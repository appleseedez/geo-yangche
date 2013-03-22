//
//  ServiceDetailViewController.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceDetailViewController.h"
#import "ServiceProfileCell.h"
#import "ServiceGallaryCell.h"
@interface ServiceDetailViewController ()
@property (nonatomic) NSMutableArray* protoypeCellHeight;
@property (nonatomic) BOOL isSelected;
@end

@implementation ServiceDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	self.protoypeCellHeight = [NSMutableArray arrayWithArray:@[@(160.0f),@(120.0f)]];
	self.isSelected = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellFactoryForRowAtIndexPath:indexPath];
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	static NSString* HeaderCellIdentifier = @"ServiceProviderCell";
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderCellIdentifier];
	}
	return cell;

}

/*
 单元格高度80pt
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [self.protoypeCellHeight[indexPath.row] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 48.0f;
}

#pragma mark - tableview delegate
#pragma mark - actions
- (void)close:(UIButton *)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}
// 喜欢按钮
- (void)toggleLikedState:(UIButton *)sender{
	sender.enabled = NO;
	if (self.isSelected == NO) {
		dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
		dispatch_async(queue, ^{
			sleep(1);
			dispatch_async(dispatch_get_main_queue(), ^{
				self.isSelected = YES;
				[sender setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateNormal];
				sender.enabled = YES;
			});
		});
	}else{
		dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
		dispatch_async(queue, ^{
			sleep(.5);
			dispatch_async(dispatch_get_main_queue(), ^{
				self.isSelected = NO;
				[sender setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
				sender.enabled = YES;
			});
		});
	}
}
// 加入购物车按钮
- (void)toggleOrderState:(UIButton *)sender{
	sender.enabled  = NO;
	if (self.isSelected == NO) {
		dispatch_queue_t queue = dispatch_queue_create("change the order state request", NULL);
		dispatch_async(queue, ^{
			sleep(.5);
			dispatch_async(dispatch_get_main_queue(), ^{
				self.isSelected = YES;
				[sender setImage:[UIImage imageNamed:@"goto-order"] forState:UIControlStateNormal];
				sender.enabled = YES;
			});
			
		});
		
	}else{
		sender.enabled = YES;
		[self performSegueWithIdentifier:@"OrderModal" sender:self];
	}
}

#pragma mark - condition segue

#pragma mark - custom method
/**
 cell factory
 */
- (UITableViewCell*)tableView:(UITableView *)tableView cellFactoryForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0) {
		NSString *CellIdentifier = @"ServiceProfileCell";
		ServiceProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (nil == cell) {
			cell = [[ServiceProfileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		}
		// 获取storyboard中设计原型的label高度.如果比这个高,就需要调整单元格高度了
		float prototypeLabelHeight =  cell.addressLabel.bounds.size.height;
		
		cell.addressLabel.text =@"地址:深圳市南山区高新科技园中区一路腾讯大厦\r\n联系电话:12345678";
		cell.addressLabel.font = [UIFont fontWithName:@"Arial" size:10];
		[cell.addressLabel sizeToFit];
		// 调整单元格高度 该单元格数据重新载入
		if (cell.addressLabel.bounds.size.height > prototypeLabelHeight) {
			[self.protoypeCellHeight replaceObjectAtIndex:indexPath.row
											   withObject:@([self.protoypeCellHeight[indexPath.row] floatValue] + cell.addressLabel.bounds.size.height - prototypeLabelHeight)];
			[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
			
		}
		
		
		return cell;
	}
	if (indexPath.row == 1) {
		NSString *CellIdentifier = @"ServiceGallaryCell";
		ServiceGallaryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (nil == cell) {
			cell = [[ServiceGallaryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		}
		return cell;
	}
	return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
}
@end
