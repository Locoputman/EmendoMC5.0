//
//  EMCInventoryCell.h
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMCInventoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemCount;
@property (weak, nonatomic) IBOutlet UILabel *itemDamage;

@end
