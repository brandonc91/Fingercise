//
//  RegisterViewController.m
//  Fingercise
//
//  Created by Brandon Cruz on 10/31/14.
//  Copyright (c) 2014 Brandon Cruz. All rights reserved.
//

#import "RegisterViewController.h"
#import "StatsViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutletCollection(UITextField) NSArray *nameFields;

- (IBAction)saveChanges:(id)sender;

@end

@implementation RegisterViewController
- (NSString *) dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
        for (int i = 0; i < 2; i++) {
            UITextField *theField = self.nameFields[i];
            theField.text = array[i];
        }
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
    
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    NSString *filePath = [self dataFilePath];
    NSArray *array = [self.nameFields valueForKey:@"text"];
    [array writeToFile:filePath atomically:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}


/*
 * Saves changes to persistent data structure within application and sends 
 * name data to StatsViewController for calculating statistics on server
 * Sends data to StatsViewController after actionsheet is presented
 */
- (IBAction)saveChanges:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Save changes?" delegate:self cancelButtonTitle:@"No thanks" destructiveButtonTitle:@"Yes please" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    NSMutableString *dataString = [[NSMutableString alloc] init];
    [dataString appendString:_firstNameField.text];
    [dataString appendString:_lastNameField.text];
    StatsViewController *statsViewController = [[StatsViewController alloc] init];
    statsViewController.data = dataString;
    [self.navigationController pushViewController:statsViewController animated:YES];
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        [self applicationWillResignActive:(NSNotification *)nil];
        
        
        if ([self.firstNameField.text length] > 0) {
            msg = [NSString stringWithFormat:@"Congrats %@, changes saved.", self.firstNameField.text];
        }
        else msg = [NSString stringWithFormat:@"Changes saved."];
        
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Changes saved." message:msg delegate:self cancelButtonTitle:@"Cool." otherButtonTitles:nil];
        [alert show];
    }
}


@end
