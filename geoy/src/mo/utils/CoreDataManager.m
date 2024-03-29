//
//  CoreDataManager.m
//  geoy
//  创建UIManagedDocument对象
//  singleton
//  Created by Pharaoh on 13-3-22.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "CoreDataManager.h"
#define DB_NAME @"GEOYangcheModel"
static CoreDataManager* _instance;

@implementation CoreDataManager

+ (void)initialize{
	NSAssert(self==[CoreDataManager class], @"Singleton! NOT for subclass");
	_instance = [CoreDataManager new];
}

+ (CoreDataManager *)share{
	return _instance;
}

@synthesize managedDocument = _managedDocument;

- (UIManagedDocument *)managedDocument{
	if (_managedDocument != nil) {
		return _managedDocument;
	}
	_managedDocument = [[UIManagedDocument alloc] initWithFileURL:[[self applicationDocumentsDirectory] URLByAppendingPathComponent:DB_NAME]];
	return _managedDocument;
}



// 获取数据文件保存目录. 总是在应用的Document目录下
- (NSURL *)applicationDocumentsDirectory{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
@end
