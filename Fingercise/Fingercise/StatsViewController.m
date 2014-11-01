//
//  StatsViewController.m
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import "StatsViewController.h"
CFSocketNativeHandle sock;
UInt8 buffer[1024];

void ConnectCallBack(
                     CFSocketRef socket,
                     CFSocketCallBackType type,
                     CFDataRef address,
                     const void *data,
                     void *info)
{
    sock = CFSocketGetNative(socket);
    char *msg = info;
    
    NSLog(@"%s\n", msg);
    
    send(sock, msg, strlen(msg) + 1, 0);
    NSLog(@"Sent Message\n");
    recv(sock, buffer, sizeof(buffer), 0); // If we wanted to write we could use
    NSLog(@"Got: %s \n", buffer);
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    return;
}
@interface StatsViewController ()

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    char msg[] = "register:Brandon Cruz\n";
    
    /* Build our socket context; this ties the joke to the socket */
    CFSocketContext context = { 0, msg, NULL, NULL, NULL } ;
    
    CFSocketRef client = CFSocketCreate(NULL, PF_INET, SOCK_STREAM, IPPROTO_TCP,
                                        kCFSocketConnectCallBack, (CFSocketCallBack)ConnectCallBack, &context );
    
    struct sockaddr_in theName;
    struct hostent *hp;
    CFDataRef addressData;
    
    theName.sin_port = htons(8889);
    theName.sin_family = AF_INET;
    
    hp = gethostbyname("localhost");
    if (hp == NULL) {
        return;
    }
    
    memcpy(&theName.sin_addr.s_addr, hp ->h_addr_list[0], hp->h_length);
    
    addressData = CFDataCreate(NULL, (UInt8 *)&theName, (CFIndex)sizeof(struct sockaddr_in));
    
    CFSocketConnectToAddress(client,addressData,1); // 1 second timeout
    CFRunLoopSourceRef sourceRef = CFSocketCreateRunLoopSource(kCFAllocatorDefault, client, 0);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), sourceRef, kCFRunLoopCommonModes);
    CFRelease(sourceRef);
    CFRunLoopRun();
    
    NSLog(@"I got: %s\n\n", buffer);
    NSString *data = [[NSString alloc] initWithCString:(char*)buffer encoding:NSASCIIStringEncoding];
    
    NSArray *list_array = [data componentsSeparatedByString:@":"];
    
    self.listData = list_array;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table View Data Source Methods
/*
 notice we have two methods to implement our protocols
 */
/*
 This method gives for each section in the table the number of rows
 it has (we only have one section in this case it returns the total number
 of rows
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

/*
 This method is a callback used to fill in table cells. Notice to save
 memory we only instiate cells which will be scene, but then we cache
 them when they become invisible
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* Name we will use for our type of table cell (if have more than one type)
     we might have more than one name. For example, we might have image and
     non image cells
     */
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = self.listData[row];
    /* If we want to style our cells we can do things like:
     cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
     */
    return cell;
}


@end
