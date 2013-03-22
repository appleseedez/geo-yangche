//
//  ServiceIndexViewController.m
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "ServiceIndexViewController.h"
#import "ServiceIndexCell.h"
#import "UIButton+animateIcon.h"
#import "CoreDataManager.h"
@interface ServiceIndexViewController ()
@property (nonatomic,weak) UIManagedDocument* databaseDocument;

@end

@implementation ServiceIndexViewController
//
//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[self useDocument];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 让刷新按钮能够指示操作正在进行
	[self.refreshButton cosplayActivityIndicator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//
//    return 10000;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ServiceIndexCell";
    ServiceIndexCell *cell = (ServiceIndexCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
		cell = [[ServiceIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
    return cell;
}

/*
 单元格高度80pt
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80.0f;
}


- (void) setupFetchResultController{
	
}

# pragma mark - actions
/*
 返回Home界面
 */
- (IBAction)backToRootPageAction:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - core data operation
/*
	检查managedDocument是否状态正常 
 */
- (void) useDocument {
	self.databaseDocument = [CoreDataManager share].managedDocument;
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self.databaseDocument.fileURL path]]) {
		[self.databaseDocument saveToURL:self.databaseDocument.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
			[self setupFetchResultController];
		}];
	}else if (self.databaseDocument.documentState == UIDocumentStateClosed){
		[self.databaseDocument openWithCompletionHandler:^(BOOL success) {
			[self setupFetchResultController];
		}];
	}else if (self.databaseDocument.documentState == UIDocumentStateNormal){
		[self setupFetchResultController];
	}
}

- (void) fetchServiceData{
	
}

/**
 获取数据
 */
- (void)fetchNewData:(UIButton *)sender{
	sender.enabled = NO;
	[self.refreshButton.imageView startAnimating];
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_async(queue, ^{
		sleep(1);
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.refreshButton.imageView stopAnimating];
			sender.enabled = YES;
			
		});
	});
}
@end
