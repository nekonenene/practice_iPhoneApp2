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
@synthesize receiver ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知センターにオブザーバ（通知を受け取るオブジェクト）を追加
    [nc addObserver:self
           selector:@selector(thenReceive:)
               name:@"TestPost"
             object:receiver ];
}

/**
 * 通知する
 */
- (void)post
{
    [receiver postNotification];
}


/**
 * 通知を受け取ったときの処理
 * @param center 通知のインスタンス
 */
- (void)thenReceive:(NSNotification *)center
{
    NSString *string = [center.userInfo objectForKey:@"string"];
    NSNumber *testKey = [center.userInfo objectForKey:@"testkey"];
    
    NSLog(@"string:%@ testKey:%@", string, testKey);
    [self setLabelString:string] ;
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