//
//  Service+JSONFormat.h
//  geoy
//
//  Created by Pharaoh on 13-3-22.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "Service.h"

@interface Service (JSONFormat)
+ (Service*) serviceWithJSONFormatInfo:(NSDictionary*) jsonInfo
				inManagedObjectContext:(NSManagedObjectContext*) context;
@end
