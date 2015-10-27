//
//  AdManager.m
//  CameraTest
//
//  Created by Yokoe on 10/27/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "AdManager.h"

@implementation AdManager
@synthesize adBottom ;

#pragma mark SetUp
- (void)viewDidLoad {
    [super viewDidLoad] ;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    @autoreleasepool
    {
        self.view.superview.backgroundColor = [UIColor clearColor] ; // コンテナーの背景を透明に
        [self bannerInit :adBottom] ;
        [super viewDidAppear:animated] ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iAd
/* iAd の初期化 */
- (void)bannerInit:(ADBannerView *)banner
{
    @autoreleasepool
    {
        banner.delegate = self ;
        [banner setHidden:YES] ;
        
        [self.view addSubview:banner] ;
        NSLog(@"iAd の初期化が完了しました%@", banner ) ;
    }
}

/* iAdを表示させる */
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    @autoreleasepool
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:nil] ;
        [UIView setAnimationDuration:0.3] ;
        
        [UIView commitAnimations] ;
        [banner setHidden:NO] ;
        NSLog(@"バナーは表示されています") ;
    }
}

/* Ad の消去作業 */
- (void)removeAd:(ADBannerView *)banner
{
    @autoreleasepool
    {
        [banner setHidden:YES] ;
        [banner removeFromSuperview] ;
        banner.delegate = nil ;
        banner = nil ;
    }
}

/* iAd を表示してみたものの、エラーが生じた場合の処理 */
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    @autoreleasepool {
        if( !banner.hidden ) // Error を吐き出し続けてアプリが落ちるのを防ぐ
        {
            [UIView beginAnimations:@"animateAddBannerOff" context:nil] ;
            [UIView setAnimationDuration:0.3] ;
            
            [banner setHidden:YES] ;
            [UIView commitAnimations] ;
            NSLog(@"!!!%@!!! %@ code : %ld \n", error, error.domain, (long)error.code) ;
        }
    }
}

@end
