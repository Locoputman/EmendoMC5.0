//
//  EMCWorldCell.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCWorldCell.h"

@implementation EMCWorldCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setBorderWidth:2];
        [self.layer setBorderColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0].CGColor];
        self.defaultWorldImage = [[UIImageView alloc] initWithFrame:CGRectMake(58, -8, 128, 128)];
        self.worldName = [[UILabel alloc] initWithFrame:CGRectMake(20, 103, 204, 30)];
        self.folderName = [[UILabel alloc] initWithFrame:CGRectMake(20, 122, 204, 30)];
        [self addSubview:self.defaultWorldImage];
        [self addSubview:self.worldName];
        [self addSubview:self.folderName];
    }
    return self;
}

@end
