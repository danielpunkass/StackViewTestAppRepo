//
//  UIView+ConstraintHelpers.m
//  StackViewTestApp
//
//  Created by Daniel Jalkut on 10/6/16.
//  Copyright © 2016 ErikPrice. All rights reserved.
//

#import "UIView+ConstraintHelpers.h"

@implementation UIView (ConstraintHelpers)

- (NSArray*) rsConstraintsForPinningToSuperviewLeft:(NSInteger)leftPadding top:(NSInteger)topPadding right:(NSInteger)rightPadding bottom:(NSInteger)bottomPadding
{
	NSMutableArray* allConstraints = [NSMutableArray array];
	UIView* baseView = self;
	NSDictionary* affectedViews = NSDictionaryOfVariableBindings(baseView);

	if (leftPadding >= 0)
	{
		NSString* horizontalFormat = [NSString stringWithFormat:@"H:|-%ld-[baseView]", leftPadding];
		NSArray* theseConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalFormat options:NSLayoutFormatDirectionLeftToRight metrics:nil views:affectedViews];
		[allConstraints addObjectsFromArray:theseConstraints];
	}

	if (rightPadding >= 0)
	{

		NSString* horizontalFormat = [NSString stringWithFormat:@"H:[baseView]-%ld-|", rightPadding];
		NSArray* theseConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalFormat options:NSLayoutFormatDirectionLeftToRight metrics:nil views:affectedViews];
		[allConstraints addObjectsFromArray:theseConstraints];
	}

	if (topPadding >= 0)
	{
		NSString* verticalFormat = [NSString stringWithFormat:@"V:|-%ld-[baseView]", topPadding];
		NSArray* theseConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalFormat options:0 metrics:nil views:affectedViews];
		[allConstraints addObjectsFromArray:theseConstraints];
	}

	if (bottomPadding >= 0)
	{
		NSString* verticalFormat = [NSString stringWithFormat:@"V:[baseView]-%ld-|", bottomPadding];
		NSArray* theseConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalFormat options:0 metrics:nil views:affectedViews];
		[allConstraints addObjectsFromArray:theseConstraints];
	}

	return allConstraints;
}

- (void) rsConstrainToSuperviewWithLeft:(NSInteger)leftPadding top:(NSInteger)topPadding right:(NSInteger)rightPadding bottom:(NSInteger)bottomPadding
{
	[[self superview] addConstraints:[self rsConstraintsForPinningToSuperviewLeft:leftPadding top:topPadding right:rightPadding bottom:bottomPadding]];
}

- (void) rsConstrainToFillSuperview
{
	[self rsConstrainToSuperviewWithLeft:0 top:0 right:0 bottom:0];
}

@end
