//
//  TopContainerController.m
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "TopContainerController.h"

@implementation TopContainerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // デリゲートを実装する : BottomContainerController クラスを送信元として設定
    BottomContainerController *bottomController = [[BottomContainerController alloc] init] ;
    bottomController.delegate = self ;
    /*[bottomController callPartnerMethod] ;*/
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

- (void)test
{
    NSLog(@"success2") ;
}


@end