//
//  CameraOverlayViewController.m
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "CameraOverlayViewController.h"

@implementation CameraOverlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)testButtonTapped:(id)sender
{
    NSLog(@"button tapped!");
}


- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame] ;
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"CameraOverlayView" bundle:[NSBundle mainBundle]] ;
        self = [nib instantiateWithOwner:self options:nil][0] ;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
