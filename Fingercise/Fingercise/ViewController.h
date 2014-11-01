//
//  ViewController.h
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

@interface ViewController : UIViewController

@property (nonatomic, copy) NSArray *listData;
@end

