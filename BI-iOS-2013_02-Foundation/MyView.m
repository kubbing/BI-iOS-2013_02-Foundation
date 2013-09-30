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
    // kdyz se vzbudite z interface builderu
    [self setup];
}

- (void)setup
{
    NSLog(@"awesome setup");

    NSString *string1 = @"prvni object";
    NSString *string2 = @"druhy object";
    
    NSArray *array = @[ string1, string2 ];

    CGFloat offset = 8;
    for (NSString *str in array) {
        ;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, offset, CGRectGetWidth(self.bounds), 44)];
        label.text = str;
        [self addSubview:label];
        
        offset += CGRectGetHeight(label.bounds) + 8;
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
