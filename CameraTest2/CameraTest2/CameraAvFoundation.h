//
//  CameraAvFoundation.h
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraAvFoundation : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureDeviceInput *videoInput ;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput ;
@property (strong, nonatomic) AVCaptureSession *session ;
@property (strong, nonatomic) UIView *previewView ;
@property(nonatomic, readonly) NSArray *availableMetadataObjectTypes ;


@end
