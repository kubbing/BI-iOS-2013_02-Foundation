//
//  MyView.m
//  BI-iOS-2013_02-Foundation
//
//  Created by Jakub Hladík on 30.09.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property (weak, nonatomic) UIImageView *imageView;

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

    for (NSString *string in sortedArray) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, offset, CGRectGetWidth(self.bounds), 44);
        [button setTitle:string forState:UIControlStateNormal];
        [self addSubview:button];
        
        offset += CGRectGetHeight(button.bounds);
    }
    
    UIImageView *imageView =
    [[UIImageView alloc] initWithFrame:CGRectMake(0, offset, CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds))];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:imageView];
    self.imageView = imageView;
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//            // load from internet, create image
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            // set image to imageView
//        });
//        
//    });
    
    NSURL *url = [NSURL URLWithString:@"http://rajce.hippotaps.com/tomato.jpg"];
    [self performSelectorInBackground:@selector(loadImageAtURL:) withObject:url];
}

- (void)loadImageAtURL:(NSURL *)url
{
    NSAssert(![[NSThread currentThread] isMainThread], @"this has to be called on a background thread");
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data
                                      scale:1.0];
    
    [self performSelectorOnMainThread:@selector(setImage:)
                           withObject:image
                        waitUntilDone:NO];
}

- (void)setImage:(UIImage *)image
{
    NSAssert([[NSThread currentThread] isMainThread], @"this has to be called on the main thread");
    
    self.imageView.image = image;
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
