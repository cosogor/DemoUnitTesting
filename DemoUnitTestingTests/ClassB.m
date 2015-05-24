//
//  ClassB.m
//  DemoUnitTesting
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

- (NSString *)info {
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"no implement!"
                                 userInfo:nil];
}

- (void)postNotification {
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"no implement!"
                                 userInfo:nil];
}

- (NSInteger)factorial:(NSInteger)number {
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"no implement!"
                                 userInfo:nil];
}

@end
