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

//@synthesize results = _results;

- (NSArray *)results
{
    double a, b, c;
    a = [self.a doubleValue];
    b = [self.b doubleValue];
    c = [self.c doubleValue];
    
    double d = (b*b) - (4*a*c);
    if (d < 0) {
        _results = @[];
    }
    else if (d == 0) {
        double res = (-b) / (2*a);
//        [NSNumber numberWithDouble:res];
        _results = @[ @(res) ];
    }
    else {
        double res1 = (-b + sqrt(d)) / (2*a);
        double res2 = (-b - sqrt(d)) / (2*a);
        _results = @[@(res1), @(res2)];
    }

    return _results;
}

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
