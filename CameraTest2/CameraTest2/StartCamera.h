//
//  StartCamera.h
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CameraOverlayViewController.h"

@interface StartCamera : CameraOverlayViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UIImagePickerController *imagePicker ;
@property UIView *mainCameraView ;
@property UIButton *startCameraButton ;

@property(nonatomic,retain) UIView *cameraOverlayView ;

@end
