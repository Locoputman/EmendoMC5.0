//
//  EMCWorldDataViewController.h
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMCSharedData.h"

@interface EMCWorldDataViewController : UIViewController {
    MCLevel *currentLevel;
}

@property (weak, nonatomic) IBOutlet UITextField *worldName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameType;
@property (weak, nonatomic) IBOutlet UITextField *health;
@property (weak, nonatomic) IBOutlet UIButton *maxHealth;
@property (weak, nonatomic) IBOutlet UITextField *time;
@property (weak, nonatomic) IBOutlet UIButton *day;

- (IBAction)worldNameChange:(UITextField *)sender;
- (IBAction)gameTypeChange:(id)sender;
- (IBAction)healthChange:(UITextField *)sender;
- (IBAction)maxHealthChange:(id)sender;
- (IBAction)timeChange:(UITextField *)sender;
- (IBAction)dayChange:(id)sender;

@end
