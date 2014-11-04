//
//  Photo+Creater.h
//  LearnMatchismo
//
//  Created by zhengxiao on 11/5/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "Photo.h"

@interface Photo (Creater)

+ (Photo *) photoWithData: (NSDictionary *) photoData inManagedObjectContext: (NSManagedObjectContext *) context;

@end
