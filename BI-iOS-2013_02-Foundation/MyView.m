//
//  MyView.m
//  BI-iOS-2013_02-Foundation
//
//  Created by Jakub Hladík on 30.09.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property (weak, nonatomic) UIImageView *myView;

@end

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
    = @{
        @"treti" : @"dalsi"
        };
    NSMutableDictionary *mutableDict = [dictionary mutableCopy];
    [mutableDict setObject:@"XXX" forKey:@"ctvrty"];
    
    NSArray *sortedArray =
    [mutableDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return NSOrderedDescending;
    }];

    for (NSString *string in sortedArray) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(8, offset, CGRectGetWidth(self.bounds) - 16, 44);
        [button setTitle:mutableDict[string] forState:UIControlStateNormal];
        [self addSubview:button];
        
        offset += 44;
    }
    
    /*
     URL
     */

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:
    CGRectMake(0,
               offset,
               CGRectGetWidth(self.bounds),
               CGRectGetWidth(self.bounds))];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    self.myView = imageView;
    
    NSURL *url = [NSURL URLWithString:@"http://spinach.hippotaps.com/spinach.jpg"];
    
    [self performSelectorInBackground:@selector(loadImageAtURL:) withObject:url];
}

- (void)loadImageAtURL:(NSURL *)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data scale:1.0]; // [UIScreen mainScreen].scale
    
    [self performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}

- (void)setImage:(UIImage *)image
{
    NSParameterAssert(image);
    NSAssert([NSThread currentThread].isMainThread, @"this has to be called on the main thread");
    
    self.myView.alpha = 0;
    __weak typeof(self) blockSelf = self;
    [UIView animateWithDuration:1 animations:^{
        blockSelf.myView.alpha = 1;
    }];
    
    self.myView.image = image;
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
