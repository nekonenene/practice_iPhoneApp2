//
//  BottomContainerController.m
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "BottomContainerController.h"

@implementation BottomContainerController
@synthesize delegate ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callPartnerMethod
{
    // デリゲートメソッドを呼び出す
    if( [ self.delegate respondsToSelector:@selector(setLabelString:) ] ) // ちゃんと配信先がメソッドを持っているか確認
    {
        NSLog(@"デリゲートメソッドを呼び出します TopContainerController.h 内の testMethod を呼び出す") ;
        [self.delegate setLabelString:@"nnn"] ;
    }
    else
    {
        NSLog(@"デリゲートメソッドを呼び出せませんでした") ;
    }
    [self.delegate test] ;
}

- (IBAction)buttonAction:(id)sender
{
    NSLog(@"押されました") ;
    [self callPartnerMethod] ;
}
@end
