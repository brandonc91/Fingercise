//
//  ExerciseViewController.h
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseViewController : UIViewController
@property (nonatomic) CGPoint position;
@property (weak,nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) NSTimer *timer;
-(IBAction)Start:(id)sender;
-(IBAction)Stop:(id)sender;
@end
