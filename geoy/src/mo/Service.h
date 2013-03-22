//
//  Service.h
//  geoy
//
//  Created by Pharaoh on 13-3-21.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Shop;

@interface Service : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) id location;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSDecimalNumber * pv;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) id score;
@property (nonatomic, retain) NSString * profile;
@property (nonatomic, retain) Shop *shop;

@end
