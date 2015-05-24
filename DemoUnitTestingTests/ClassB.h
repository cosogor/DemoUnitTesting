//
//  ClassB.h
//  DemoUnitTesting
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassB : NSObject

@property (copy, nonatomic) void (^block)();

- (NSString *)info;
- (void)postNotification;
- (NSInteger)factorial:(NSInteger)number;

@end
