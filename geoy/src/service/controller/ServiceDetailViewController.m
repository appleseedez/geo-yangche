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
