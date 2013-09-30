//
//  Solver.m
//  BI-iOS-2013_02-Foundation
//
//  Created by Jakub Hladík on 30.09.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "Solver.h"

@interface Solver ()

@property (strong, nonatomic) NSNumber *a;
@property (strong, nonatomic) NSNumber *b;
@property (strong, nonatomic) NSNumber *c;
@property (strong, nonatomic) NSArray *results;

@end

@implementation Solver

- (instancetype)init
{
    self = [super init];
    if (self) {
        // setup
    }
    return self;
}

- (instancetype)initWithA:(NSNumber *)a
                        B:(NSNumber *)b
                        c:(NSNumber *)c
{
    self = [self init];
    if (self) {
        self.a = a;
        self.b = b;
        self.c = c;
    }
    return self;
}

@end
