//
//  AdManager.m
//  CameraTest
//
//  Created by Yokoe on 10/27/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "AdManager.h"

@implementation AdManager

- (void)viewDidLoad {
    [super viewDidLoad] ;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    @autoreleasepool
    {
        [super viewDidAppear:animated] ;
        
        [self bannerInit :adBottom] ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
