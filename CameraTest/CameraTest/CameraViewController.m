//
//  CameraViewController.m
//  CameraTest
//
//  Created by Yokoe on 10/26/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

// @synthesize adBottom ;
@synthesize toTopViewButton ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    @autoreleasepool
    {
        [super viewDidAppear:animated] ;
    
        [self bannerInit :adBottom] ;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
