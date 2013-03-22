//
//  Service+JSONFormat.m
//  geoy
//
//  Created by Pharaoh on 13-3-22.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "Service+JSONFormat.h"

@implementation Service (JSONFormat)
+ (Service *)serviceWithJSONFormatInfo:(NSDictionary *)jsonInfo inManagedObjectContext:(NSManagedObjectContext *)context{
	Service* service = nil;
	service = [NSEntityDescription insertNewObjectForEntityForName:@"Service" inManagedObjectContext:context];
	service.name = [jsonInfo valueForKey:@"name"];
	service.price = [jsonInfo valueForKey:@"price"];
	return service;
}
@end
