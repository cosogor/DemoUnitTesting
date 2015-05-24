//
//  ClassA.h
//  DemoUnitTesting
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ClassB;

@interface ClassA : NSObject

@property (strong, nonatomic, readonly) ClassB *classB;
@property (assign, nonatomic, readonly) NSInteger count;

- (instancetype)initWithClassB:(ClassB *)classB;
- (instancetype)initWithCount:(NSInteger)count;

- (void)useBlockInClassB;

@end
