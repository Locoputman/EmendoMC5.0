//
//  EMCWorldCell.h
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface EMCWorldCell : PSTCollectionViewCell

@property (strong) UIImageView *defaultWorldImage;

@property (strong) UILabel *worldName;
@property (strong) UILabel *folderName;

@end
