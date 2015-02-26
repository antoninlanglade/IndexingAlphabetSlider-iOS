//
//  Created by Antonin Langlade on 25/02/2015.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

#import "IndexingAlphabetSliderView.h"

@implementation IndexingAlphabetSliderView{
    CGSize letterBlockSize;
}

- (id)initWithFrame:(CGRect)frame letters:(NSArray*)letters heightLetter:(float)height{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.letterBlocks = [NSMutableArray array];
        
        letterBlockSize = CGSizeMake(self.frame.size.width, height);
        
        self.letters = [NSMutableArray array];
        
        for (int i = 0; i < [letters count]; i++) {
            NSString *letter = [[letters objectAtIndex:i] substringToIndex:1];
            BOOL isExist = false;
            for(int j = 0; j < [self.letters count]; j++){
                isExist |= [[[self.letters objectAtIndex:j] objectForKey:@"letter"] isEqualToString:letter];
            }
            if(!isExist){
                NSDictionary *dicoLetter = @{@"index" : [NSNumber numberWithInt:i],
                                             @"letter" : letter};
                [self.letters addObject:dicoLetter];
            }
        }
        
        for(int i = 0; i < [self.letters count]; i++){
            [self addSubview:[self createLetterBlock:i]];
        }
        
        UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressDetected:)];
        longPressRecognizer.minimumPressDuration = .05;
        longPressRecognizer.numberOfTouchesRequired = 1;
        longPressRecognizer.delegate = self;
        [self addGestureRecognizer:longPressRecognizer];
    }
    return self;
}
-(UIView*)createLetterBlock:(int)index{
    
    UIView *letterBlock = [[UIView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height * .5) - ([self.letters count] * letterBlockSize.height * .5) + (index * letterBlockSize.height), letterBlockSize.width, letterBlockSize.height)];
    
    UILabel *letterLBL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, letterBlockSize.width, letterBlockSize.height)];
    letterLBL.text = [[self.letters objectAtIndex:index] objectForKey:@"letter"];
    letterLBL.textColor = [UIColor grayColor];
    [letterLBL setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
    letterLBL.textAlignment = NSTextAlignmentCenter;
    [letterBlock addSubview:letterLBL];
    
    [self.letterBlocks addObject:letterBlock];
    
    return letterBlock;
}

-(void)longPressDetected:(UITapGestureRecognizer *)sender{
    
    self.touchPosition = [sender locationInView:self];
    int index = 0;
    for (int i = 0; i < [self.letterBlocks count]; i++) {
        UIView *letterBlock = self.letterBlocks[i];
        if(self.touchPosition.y > letterBlock.frame.origin.y && self.touchPosition.y <= letterBlock.frame.origin.y + letterBlock.frame.size.height){
            index = i;
        }
    }
    [self.delegate alphabetDelegate:[[[self.letters objectAtIndex:index] objectForKey:@"index"] intValue]];
}

@end
