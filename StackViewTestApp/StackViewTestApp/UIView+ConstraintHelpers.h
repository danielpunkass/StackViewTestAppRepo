//
//  UIView+ConstraintHelpers.h
//  StackViewTestApp
//
//  Created by Daniel Jalkut on 10/6/16.
//  Copyright © 2016 ErikPrice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ConstraintHelpers)

- (void) rsConstrainToFillSuperview;

- (void) rsConstrainToSuperviewWithLeft:(NSInteger)leftPadding top:(NSInteger)topPadding right:(NSInteger)rightPadding bottom:(NSInteger)bottomPadding;

@end
