//
//  ViewController.h
//  FastestRPM
//
//  Created by Chelsea Liu on 6/18/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *speedNeedle;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *dragGesture;

-(void)dragVelocity:(UIPanGestureRecognizer*)recognizer;



@end

