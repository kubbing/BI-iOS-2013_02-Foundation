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
    
    /*
     Array
     */
    
    NSString *string1 = @"prvni object";
    NSArray *array = @[
                       string1,
                       @"dalsi object",
                       @"jeste jeden"];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    [mutableArray addObject:@"ctvrty Object"];
    
//    id object = @[ @"", @(7), @[], @[] ];
    
    CGFloat offset = 8;
    for (NSString *string in mutableArray) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(8, offset, CGRectGetWidth(self.bounds) - 16, 44);
        label.text = string;
        [self addSubview:label];
        
        offset += 44;
    }
    
    /*
     Dictionary
     */
    
    NSDictionary *dictionary
    = @{@"prvni" : @"1. hodnota",
        @"druhy" : @"2. hodnota",
        @"treti" : @"dalsi"
        };
    NSMutableDictionary *mutableDict = [dictionary mutableCopy];
    [mutableDict setObject:@"XXX" forKey:@"ctvrty"];
    
    for (NSString *string in mutableDict.allKeys) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(8, offset, CGRectGetWidth(self.bounds) - 16, 44);
        [button setTitle:mutableDict[string] forState:UIControlStateNormal];
        [self addSubview:button];
        
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
