//
//  ViewController.h
//  CameraTest
//
//  Created by Yokoe on 10/26/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController<ADBannerViewDelegate>
{
@protected
    ADBannerView *adBottom ;
}
@property (nonatomic, retain) IBOutlet ADBannerView *adBottom ;
@property IBOutlet UIButton *toCameraViewButton ;
@property IBOutlet UIButton *toTopViewButton ;

@property IBOutlet UITabBarItem *toHomeTab ;
@property IBOutlet UITabBarItem *toCameraTab ;

@property IBOutlet UIView *adBottomContainer ;

- (IBAction)toCameraViewButton:(id)sender ;
- (IBAction)toTopViewButton:(id)sender ;
- (void)bannerInit:(ADBannerView *)banner ;
- (void)bannerViewDidLoadAd:(ADBannerView *)banner ;
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error ;

@end
