//
//  BottomContainerController.h
//  delegateTest
//
//  Created by Yokoe on 10/30/15.
//  Copyright © 2015 Hatonekoe. All rights reserved.
//

#import "ViewController.h"

@class BottomContainerController ;

@protocol BottomContainerControllerDelegate <NSObject>

@optional

- (void)setLabelString:(NSString *)string ;

- (void)test ;

@end


@interface BottomContainerController : ViewController

- (IBAction)buttonAction:(id)sender ;
- (void)callPartnerMethod ;
@property (nonatomic, weak) id<BottomContainerControllerDelegate> delegate ;

@end
