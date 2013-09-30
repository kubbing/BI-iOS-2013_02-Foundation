//
//  Solver.h
//  BI-iOS-2013_02-Foundation
//
//  Created by Jakub Hladík on 30.09.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solver : NSObject

@property (strong, nonatomic) NSArray *results;

- (instancetype)init;
- (instancetype)initWithA:(NSNumber *)a
                        B:(NSNumber *)b
                        C:(NSNumber *)c;

@end
