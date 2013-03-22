//
//  CoreDataManager.h
//  geoy
//
//  Created by Pharaoh on 13-3-22.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
@property(nonatomic,readonly) UIManagedDocument* managedDocument;
+ (CoreDataManager*) share;

@end
