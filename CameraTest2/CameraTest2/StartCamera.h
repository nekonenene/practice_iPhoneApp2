//
//  StartCamera.h
//  CameraTest2
//
//  Created by Yokoe on 10/28/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AdManager.h"

@interface StartCamera : ViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UIImagePickerController *imagePicker ;
// @property UIImagePickerController *imagePickerController ;
@property UIView *mainCameraView ;

@property UIButton *startCameraButton ;

@end
