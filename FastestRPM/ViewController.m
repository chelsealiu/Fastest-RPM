//
//  ViewController.m
//  FastestRPM
//
//  Created by Chelsea Liu on 6/18/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.speedNeedle.transform = CGAffineTransformRotate(self.speedNeedle.transform, (M_PI/180)*0);
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)dragAcrossScreen:(id)sender {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragVelocity:)];
    [self.view addGestureRecognizer:panGesture];
    
}


-(void)dragVelocity:(UIPanGestureRecognizer*)recognizer

{

    CGPoint velocity;
    
    float tempAngle;

    if ([recognizer state] == UIGestureRecognizerStateBegan) {
        
        velocity = [recognizer velocityInView:self.view];
        float tempVelocity = sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
        NSLog(@"%f", tempVelocity);
        tempAngle = (tempVelocity/10000)*270;
        
        self.speedNeedle.transform = CGAffineTransformMakeRotation((M_PI/180)*tempAngle);
    }
    
    else if ([recognizer state] == UIGestureRecognizerStateChanged) {
        
        velocity = [recognizer velocityInView:self.view];
        float tempVelocity = sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
        tempAngle = (tempVelocity/2000)*270;
        NSLog(@"%f", tempAngle);
        
        self.speedNeedle.transform = CGAffineTransformMakeRotation((M_PI/180)*tempAngle);

    }
    
    else if ([recognizer state] == UIGestureRecognizerStateEnded) {
        
        self.speedNeedle.transform = CGAffineTransformIdentity;

    }
}


@end
