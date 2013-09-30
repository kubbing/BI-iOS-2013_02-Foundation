//
//  MyView.m
//  BI-iOS-2013_02-Foundation
//
//  Created by Jakub Hladík on 30.09.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    self.backgroundColor = [UIColor whiteColor];
    
    NSString *string1 = @"prvni object";
    NSArray *array = [NSArray arrayWithObject:string1];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    [mutableArray addObject:@"druhy Object"];
    
    CGFloat offset = 8;
    for (NSString *string in mutableArray) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(8, offset, CGRectGetWidth(self.bounds) - 16, 44);
        label.text = string;
        [self addSubview:label];
        
        offset += 44;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
