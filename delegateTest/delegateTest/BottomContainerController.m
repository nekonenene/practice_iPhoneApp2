//
//  BottomContainerController.m
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "BottomContainerController.h"

@implementation BottomContainerController
@synthesize button ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender
{
    NSLog(@"押されました") ;
    [self postNotification] ;
}

- (void)postNotification
{
    NSDictionary *sendInfo = [[NSDictionary alloc] initWithObjectsAndKeys:@"Hi !!", @"string", @"testData", @"testKey", nil ] ;
    NSNotificationCenter *nsnc = [NSNotificationCenter defaultCenter] ;
    
    // 通知してみる
    [nsnc postNotificationName:@"TestPost" object:self userInfo:sendInfo] ;
}
@end
