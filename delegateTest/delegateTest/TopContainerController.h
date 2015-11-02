//
//  TopContainerController.h
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"
#import "BottomContainerController.h"

#pragma maek interface
@interface TopContainerController : ViewController
@property IBOutlet UILabel  *stringLabel ;
@property BottomContainerController *receiver ;
- (void)setLabelString:(NSString *)string ;

@end

