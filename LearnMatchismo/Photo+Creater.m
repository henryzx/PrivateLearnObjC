//
//  Photo+Creater.m
//  LearnMatchismo
//
//  Created by zhengxiao on 11/5/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "Photo+Creater.h"
#import <CoreData/CoreData.h>
#import "Entity.h"

@implementation Photo (Creater)

+ (Photo *) photoWithData: (NSDictionary *) photoData inManagedObjectContext: (NSManagedObjectContext *) context{
    
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName: @"Photo" inManagedObjectContext: context];
    Entity *entity = [NSEntityDescription insertNewObjectForEntityForName: @"Entity" inManagedObjectContext: context];
    photo.title = @"Baby Photo";
    photo.whoTook = entity;
    entity.name =@"Baby";
    
    return photo;
}

@end
