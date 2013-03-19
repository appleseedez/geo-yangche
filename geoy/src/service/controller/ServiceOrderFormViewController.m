//
//  ServiceOrderFormViewController.m
//  geoy
//
//  Created by Pharaoh on 13-3-19.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceOrderFormViewController.h"

@interface ServiceOrderFormViewController ()

@end

@implementation ServiceOrderFormViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
    return cell;
}


#pragma mark - actions
- (void)close:(UIButton *)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
