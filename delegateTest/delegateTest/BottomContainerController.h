//
//  BottomContainerController.h
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"

@class SampleDelegate ;

#pragma mark protocol
@protocol SampleDelegate <NSObject>

@end


#pragma maek interface
@interface BottomContainerController : ViewController

- (IBAction)testMethod:(id)sender ;

@property (nonatomic, weak) id<SampleDelegate> delegate;

@end

