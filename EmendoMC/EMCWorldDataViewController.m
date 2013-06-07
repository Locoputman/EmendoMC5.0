//
//  EMCWorldDataViewController.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCWorldDataViewController.h"

@interface EMCWorldDataViewController ()

- (void)refresh;

@end

@implementation EMCWorldDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refresh];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refresh];
}

- (void)refresh
{
    currentLevel = [[EMCSharedData sharedData] currentLevel];
    [_worldName setText:currentLevel.levelName];
    [_gameType setSelectedSegmentIndex:currentLevel.gameType];
    [_health setText:[NSString stringWithFormat:@"%d", currentLevel.health]];
    [_time setText:[NSString stringWithFormat:@"%ld", currentLevel.time]];
    
    UIImage *button = [[UIImage imageNamed:@"button"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 6, 5)];
    [_maxHealth setBackgroundImage:button forState:UIControlStateNormal];
    [_day setBackgroundImage:button forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)worldNameChange:(UITextField *)sender {
    [currentLevel setLevelName:sender.text];
    [self refresh];
}

- (IBAction)gameTypeChange:(id)sender {
    [currentLevel setGameType:[_gameType selectedSegmentIndex]];
    [self refresh];
}

- (IBAction)healthChange:(UITextField *)sender {
    [currentLevel setHealth:sender.text.intValue];
    [self refresh];
}

- (IBAction)maxHealthChange:(id)sender {
    [currentLevel setHealth:32767];
    [self refresh];
}

- (IBAction)timeChange:(UITextField *)sender {
    [currentLevel setTime:sender.text.intValue];
    [self refresh];
}

- (IBAction)dayChange:(id)sender {
    [currentLevel setTime:0];
    [self refresh];
}

@end
