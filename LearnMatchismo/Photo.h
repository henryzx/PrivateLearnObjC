//
//  Photo.h
//  LearnMatchismo
//
//  Created by zhengxiao on 11/5/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSManagedObject *whoTook;

@end
