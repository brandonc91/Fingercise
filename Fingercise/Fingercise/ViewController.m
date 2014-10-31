//
//  ViewController.m
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import "ViewController.h"
#import "ExerciseViewController.h"
#import "StatsViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@property (strong, nonatomic) ExerciseViewController *exerciseViewController;
@property (strong,nonatomic) StatsViewController *statsViewController;
@property (strong, nonatomic) RegisterViewController *registerViewController;

@end

@implementation ViewController

-(IBAction)switchViews:(id)sender
{
    if (!self.exerciseViewController.view.superview) {
        if (!self.exerciseViewController) {
            self.exerciseViewController = [self.storyboard
                                            instantiateViewControllerWithIdentifier:@"Exercise"];
        }
        [self.statsViewController.view removeFromSuperview];
        [self.registerViewController.view removeFromSuperview];
        [self.view insertSubview:self.exerciseViewController.view atIndex:0];
    } else {
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
