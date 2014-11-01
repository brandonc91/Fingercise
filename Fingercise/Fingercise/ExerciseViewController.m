//
//  ExerciseViewController.m
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import "ExerciseViewController.h"

@interface ExerciseViewController ()
- (IBAction)beginGame:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *frogButton;
@property (weak, nonatomic) IBOutlet UIButton *starButton;
@property (weak, nonatomic) IBOutlet UIButton *colorButton;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UIButton *startGame;
@property (weak, nonatomic) IBOutlet UIButton *endGame;
@property (weak, nonatomic) IBOutlet UIImageView *flyImage;
- (IBAction)endGame:(id)sender;
@end

@implementation ExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _startGame.hidden = YES;
    _endGame.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Start:(id)sender {
    _timer = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(IBAction)Stop:(id)sender {
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

-(void) onTimer {
    _image.center = CGPointMake(_image.center.x+_position.x, _image.center.y+_position.y);
    _position = CGPointMake(0.0, 0.15);
}


- (IBAction)beginGame:(id)sender {
    _frogButton.hidden = YES;
    _starButton.hidden = YES;
    _colorButton.hidden = YES;
    _startGame.hidden = NO;
    _endGame.hidden = NO;
    _flyImage.hidden = NO;
}

-(IBAction)endGame:(id)sender {
    _playAgainButton.hidden = NO;
}
@end
