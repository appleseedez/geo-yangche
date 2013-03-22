//
//  Shop.h
//  geoy
//
//  Created by Pharaoh on 13-3-21.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Shop : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * profile;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) id location;
@property (nonatomic, retain) NSSet *services;
@end

@interface Shop (CoreDataGeneratedAccessors)

- (void)addServicesObject:(Service *)value;
- (void)removeServicesObject:(Service *)value;
- (void)addServices:(NSSet *)values;
- (void)removeServices:(NSSet *)values;

@end
