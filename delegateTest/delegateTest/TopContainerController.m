//
//  TopContainerController.m
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "TopContainerController.h"

@implementation TopContainerController
@synthesize stringLabel ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setLabelString:(NSString *)string
{
    NSLog(@"success") ;
    stringLabel.text = string ;
}

@end