//
//  ViewController.m
//  StackViewTestApp
//
//  Created by Erik Price on 2016-10-06.
//

#import "ViewController.h"
#import "UIView+ConstraintHelpers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    UIViewController *vc = [[UIViewController alloc] initWithNibName:@"MyView" bundle:nil];
	vc.view.backgroundColor = [UIColor greenColor];
	
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];

	[vc.view rsConstrainToFillSuperview];

    [vc didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
