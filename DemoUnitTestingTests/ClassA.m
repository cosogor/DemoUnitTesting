//
//  ClassA.m
//  DemoUnitTesting
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import "ClassA.h"

@interface ClassA ()

@property (strong, nonatomic, readwrite) ClassB *classB;
@property (assign, nonatomic, readwrite) NSInteger count;

@end


@implementation ClassA

- (instancetype)initWithClassB:(ClassB *)classB {
    self = [super init];
    if (self) {
        self.classB = classB;
    }
    return self;
}

- (instancetype)initWithCount:(NSInteger)count {
    self = [super init];
    if (self) {
        self.count = count;
    }
    return self;
}

- (void)useBlockInClassB {
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"no implement!"
                                 userInfo:nil];
}

@end
