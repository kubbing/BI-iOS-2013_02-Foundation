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

@end

@implementation Solver

@synthesize results = _results;

- (NSArray *)results
{
    double a, b, c;
    a = [self.a doubleValue];
    b = [self.b doubleValue];
    c = [self.c doubleValue];
    
    double d = (b * b) - (4 * a * c);
    if (d < 0) {
        _results = @[];
    }
    else if (d == 0) {
        NSNumber *res = @((-b) / (2.0 * a));
        _results = @[res];
    }
    else {
        NSNumber *res1 = @((-b + sqrt(d)) / (2.0 * a));
        NSNumber *res2 = @((-b - sqrt(d)) / (2.0 * a));
        _results = @[res1, res2];
    }
    
    return _results;
}

- (void)setResults:(NSArray *)results
{
    _results = results;
}

- (void)dealloc
{
    ;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        ;
    }
    return self;
}

- (instancetype)initWithA:(NSNumber *)a
                        B:(NSNumber *)b
                        C:(NSNumber *)c
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
