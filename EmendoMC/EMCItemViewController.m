//
//  EMCItemViewController.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCItemViewController.h"

@interface EMCItemViewController ()

- (void)refresh;

@end

@implementation EMCItemViewController

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
    currentItem = [[EMCSharedData sharedData] currentItem];
    [self.countField setText:[NSString stringWithFormat:@"%d", currentItem.count]];
    [self.damageField setText:[NSString stringWithFormat:@"%d", currentItem.damage]];
    [self.idField setText:[NSString stringWithFormat:@"%d", currentItem.ID]];
    
    NSDictionary *all = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"all" ofType:@"plist"]];
    NSString *name = [all objectForKey:[NSString stringWithFormat:@"%d", currentItem.ID]];
    
    [self.itemImage.layer setMagnificationFilter:kCAFilterNearest];
    [self.itemImage setImage:[EMCImageLoader imageForName:name]];
    
    UIImage *button = [[UIImage imageNamed:@"button"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 6, 5)];
    [self.chooseButton setBackgroundImage:button forState:UIControlStateNormal];
    [self.maxButton setBackgroundImage:button forState:UIControlStateNormal];
    [self.deleteButton setBackgroundImage:button forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)idChange:(UITextField *)sender {
    [[EMCSharedData sharedData].currentItem setID:[sender.text intValue]];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
    [self refresh];
}

- (IBAction)countChange:(UITextField *)sender {
    [[EMCSharedData sharedData].currentItem setCount:[sender.text intValue]];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
    [self refresh];
}

- (IBAction)damageChange:(UITextField *)sender {
    [[EMCSharedData sharedData].currentItem setDamage:[sender.text intValue]];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
    [self refresh];
}

- (IBAction)maxCount:(id)sender {
    [[EMCSharedData sharedData].currentItem setCount:255];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
    [self refresh];
}

- (IBAction)deleteDamage:(id)sender {
    [[EMCSharedData sharedData].currentItem setDamage:0];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
    [self refresh];
}

@end
