//
//  ViewController.m
//  CameraTest
//
//  Created by Yokoe on 10/26/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize adBottom ;
@synthesize adBottomContainer ;

@synthesize toCameraViewButton ;
@synthesize toTopViewButton ;

@synthesize toHomeTab ;
@synthesize toCameraTab ;

- (void)viewDidLoad {
    [super viewDidLoad] ;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    @autoreleasepool
    {
        [super viewDidAppear:animated] ;
    }
}

#pragma mark Button
- (IBAction)toCameraViewButton:(id)sender
{
    @autoreleasepool
    {
        // [adBottom setHidden:YES] ;
        // [self removeAd:adBottom] ;
        // IDを指定してSegueを呼び出します。
        [self performSegueWithIdentifier:@"toCameraViewSegue" sender:self];
    }
}

- (IBAction)toTopViewButton:(id)sender
{
    @autoreleasepool
    {
        // IDを指定してSegueを呼び出します。
        // IDを条件分岐することによって2つ目のViewと入れ替える事ができます。
        // [self.navigationController pushViewController:@"pushCamera" animated:YES];
        [UIView beginAnimations:@"animateAdBannerOn" context:nil] ;
        [UIView setAnimationDuration:2] ;
        
        // [adBottom setHidden:YES] ;
        // [self removeAd:adBottom] ;
        
        // [self dismissViewControllerAnimated:YES completion:NULL];
        [self performSegueWithIdentifier:@"toTopViewSegue" sender:self];
        [UIView commitAnimations] ;
    }
}

#pragma mark iAd
/* iAd の初期化 */
- (void)bannerInit:(ADBannerView *)banner
{
    @autoreleasepool
    {
        adBottomContainer.backgroundColor = [UIColor clearColor] ;
        banner.delegate = self ;
        [adBottomContainer setHidden:YES] ;
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
        
        [adBottomContainer setHidden:NO] ;
        
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
        [adBottomContainer setHidden:YES] ;
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
            
            [adBottomContainer setHidden:YES] ;
            [banner setHidden:YES] ;
            [UIView commitAnimations] ;
            NSLog(@"!!!%@!!! %@ code : %ld \n", error, error.domain, (long)error.code) ;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
