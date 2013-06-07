//
//  EMCItemViewController.h
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "EMCSharedData.h"
#import "EMCImageLoader.h"

@interface EMCItemViewController : UIViewController {
    MCInventoryItem *currentItem;
}

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UIButton *chooseButton;
@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UITextField *damageField;
@property (weak, nonatomic) IBOutlet UIButton *maxButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

- (IBAction)idChange:(UITextField *)sender;
- (IBAction)countChange:(UITextField *)sender;
- (IBAction)damageChange:(UITextField *)sender;
- (IBAction)maxCount:(id)sender;
- (IBAction)deleteDamage:(id)sender;

@end
