//
//  AdManager.h
//  CameraTest
//
//  Created by Yokoe on 10/27/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface AdManager : ViewController<ADBannerViewDelegate>
{
@protected
    ADBannerView *adBottom ;
}
@property (nonatomic, retain) IBOutlet ADBannerView *adBottom ;

@end
