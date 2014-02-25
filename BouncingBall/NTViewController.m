//
//  NTViewController.m
//  BouncingBall
//
//  Created by Nikolai Chen on 2/25/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "NTViewController.h"
@import QuartzCore;

@interface NTViewController ()
@property (weak, nonatomic) IBOutlet UIView *ballView;
@property (strong, nonatomic) CADisplayLink *ninja2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ballXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ballYConstraint;

@property (assign, nonatomic) CGPoint velocity;

//@property (assign, nonatomic) CGFloat theta;
@end

@implementation NTViewController

-(void)tick:(CADisplayLink *)sender
{
    CGPoint vel =self.velocity;
    CGFloat width= CGRectGetWidth(self.view.bounds);

    if (CGRectGetMaxX(self.ballView.frame)>=width) {
        vel.x=-ABS(vel.x);
    }
    self.velocity=vel;

    CGPoint pos= CGPointMake(self.ballXConstraint.constant, self.ballYConstraint.constant);
//    self.theta += 0.1;
//    CGFloat width= CGRectGetWidth(self.view.bounds);
//    CGFloat x=width/2.0 * sin(self.theta) + width/2.0;
    self.ballXConstraint.constant= pos.x + self.velocity.x;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.velocity= CGPointMake(10.0, 0.0);

    self.ninja2 = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];

    [self.ninja2 addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

@end
