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
#import "AFJSONRequestOperation.h"
#import "Service+JSONFormat.h"
@interface ServiceIndexViewController ()
@property (nonatomic,weak,readonly) UIManagedDocument* databaseDocument;

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
/*
 当列表即将呈现时.
 */
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



@synthesize databaseDocument = _databaseDocument;

#pragma mark - getter
- (UIManagedDocument *)databaseDocument{
	if (_databaseDocument != nil) {
		return _databaseDocument;
	}
	_databaseDocument = [CoreDataManager share].managedDocument;
	return _databaseDocument;
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
	Service* service = [self.fetchedResultsController objectAtIndexPath:indexPath];
	cell.serviceTitleLabel.text = service.name;
	cell.priceLabel.text = [NSString stringWithFormat:@"$ %@",service.price];
    return cell;
}

/*
 单元格高度80pt
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80.0f;
}


- (void) setupFetchResultController{
	NSFetchRequest* fetchAllServiceRequest = [NSFetchRequest fetchRequestWithEntityName:@"Service"];
	fetchAllServiceRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
	self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchAllServiceRequest managedObjectContext:self.databaseDocument.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
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
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self.databaseDocument.fileURL path]]) {
		[self.databaseDocument saveToURL:self.databaseDocument.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
			[self setupFetchResultController];
			[self fetchServiceDataInDocument:self.databaseDocument];
		}];
	}else if (self.databaseDocument.documentState == UIDocumentStateClosed){
		[self.databaseDocument openWithCompletionHandler:^(BOOL success) {
			[self setupFetchResultController];
		}];
	}else if (self.databaseDocument.documentState == UIDocumentStateNormal){
		[self setupFetchResultController];
	}
}
#define JSON_URL @"https://api.mongolab.com/api/1/databases/yangche-geo/collections/services?apiKey=1gdxdp157X9xPkkGHFsH4MYBWWYaS37o"
- (void) fetchServiceDataInDocument:(UIManagedDocument*)document{
	AFJSONRequestOperation* fetchServiceOperation =
	[AFJSONRequestOperation JSONRequestOperationWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:JSON_URL]]
													success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
		
														dispatch_queue_t serviceDataPersistenceQueue = dispatch_queue_create("persistence service data", NULL);
														dispatch_async(serviceDataPersistenceQueue, ^{
															// json数据从服务器返回了. 把它添加到本地coredata数据集合中
															NSDictionary* serviceDataSet = JSON;
															[document.managedObjectContext performBlock:^{
																for (NSDictionary* serviceInfo in serviceDataSet) {
																	[Service serviceWithJSONFormatInfo:serviceInfo inManagedObjectContext:document.managedObjectContext];
																}
																dispatch_async(dispatch_get_main_queue(), ^{
																	[self.refreshButton.imageView stopAnimating];
																	self.refreshButton.enabled = YES;
																});
															}];
															
														});
														
													}
													failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
														// do the error handle
														dispatch_async(dispatch_get_main_queue(), ^{
															[self.refreshButton.imageView stopAnimating];
															self.refreshButton.enabled = YES;
															
														});
													}
	];
	self.refreshButton.enabled = NO;
	[self.refreshButton.imageView startAnimating];
	[fetchServiceOperation start];
}

/**
 获取数据
 */
- (void)fetchNewData:(UIButton *)sender{
//	sender.enabled = NO;
//	
//	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//	dispatch_async(queue, ^{
//		sleep(1);
//		dispatch_async(dispatch_get_main_queue(), ^{
//			
//			sender.enabled = YES;
//			
//		});
//	});
	NSLog(@"click");
}
@end
