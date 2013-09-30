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
    
    /*
     Array
     */
    
    NSArray *array = @[ string1, string2 ];

    CGFloat offset = 8;
    for (NSString *str in array) {
        ;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, offset, CGRectGetWidth(self.bounds), 44)];
        label.text = str;
        [self addSubview:label];
        
        offset += CGRectGetHeight(label.bounds) + 8;
    }
    
    /*
     Dictionary
     */
    
    NSDictionary *dictionary;
    dictionary = @{
                   [@(1) description] : string1,
                   [@(2) description] : string2 };
    
    NSArray *keyArray = dictionary.allKeys;
    NSArray *sortedArray =
    [keyArray sortedArrayWithOptions:0
                     usingComparator:^NSComparisonResult(id obj1, id obj2) {
                         return NSOrderedAscending;
                     }];

    for (NSString *strig in sortedArray) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, offset, CGRectGetWidth(self.bounds), 44);
        [button setTitle:strig forState:UIControlStateNormal];
        [self addSubview:button];
        
        offset += CGRectGetHeight(button.bounds);
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
