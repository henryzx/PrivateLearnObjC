//
//  Ship.m
//  LearnMatchismo
//
//  Created by zhengxiao on 10/30/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

#import "Ship.h"

@implementation Ship

-(void) move: (NSString *) steps withName:(NSString *) name{
    NSLog(@"%@ moved %@", name, steps);
    
    // Try to write Current Date to standardUserDefaults
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[[NSDate alloc] init] forKey:@"lastSaveTime"];
    [defaults synchronize];
}

- (NSString *) shoot{
    NSLog(@"shooting at target");
    
    // Try Enumeration through a Dictionary
    NSDictionary *myDictionary = @{@"name": @"value", @"baby": @"nancy"};
    
    for (id key in myDictionary) {
        id value = [myDictionary objectForKey:key];
        if ([value isKindOfClass: [NSString class]]){
            NSString *string = (NSString *) value;
            NSLog(@"enumerated %@",string);
        }
    }
    
    // Try to read lastSaveTime from standardUserDefaults
    
    id lastSaveTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastSaveTime"];
    if(lastSaveTime)
        NSLog(@"lastSaveTime is %@", lastSaveTime);
    
    return @"shooting at target!";
}

- (void) makeRange {
    NSRange range = NSMakeRange(2, 3);
    NSString *subString = [@"hi baby" substringWithRange:range];
    if (subString){
        NSLog(@"madeRange from String to %@",subString);
    }
}

@end
