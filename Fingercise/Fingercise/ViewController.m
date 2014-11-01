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


//
//CFSocketNativeHandle sock;
//UInt8 buffer[1024];
//
//void ConnectCallBack(
//                     CFSocketRef socket,
//                     CFSocketCallBackType type,
//                     CFDataRef address,
//                     const void *data,
//                     void *info)
//{
//    sock = CFSocketGetNative(socket);
//    char *msg = info;
//    
//    NSLog(@"%s\n", msg);
//    
//    send(sock, msg, strlen(msg) + 1, 0);
//    NSLog(@"Sent Message\n");
//    recv(sock, buffer, sizeof(buffer), 0); // If we wanted to write we could use
//    NSLog(@"Got: %s \n", buffer);
//    
//    CFRunLoopStop(CFRunLoopGetCurrent());
//    return;
//}

@interface ViewController ()

@property (strong, nonatomic) ExerciseViewController *exerciseViewController;
@property (strong,nonatomic) StatsViewController *statsViewController;
@property (strong, nonatomic) RegisterViewController *registerViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Register View Data Source Methods



@end
