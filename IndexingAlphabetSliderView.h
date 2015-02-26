//
//  Created by Antonin Langlade on 25/02/2015.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlphabetDelegate

-(void)alphabetDelegate:(NSInteger)index;

@end

@interface IndexingAlphabetSliderView : UIView<UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSMutableArray *letters;
@property (strong, nonatomic) NSMutableArray *letterBlocks;
@property (nonatomic, assign) id delegate;
@property CGPoint touchPosition;

- (id)initWithFrame:(CGRect)frame letters:(NSArray*)letters heightLetter:(float)height;

@end
