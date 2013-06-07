//
//  EMCSharedData.h
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMCSharedData : NSObject

+ (EMCSharedData *)sharedData;

@property (strong) MCLevel *currentLevel;
@property (strong) MCInventoryItem *currentItem;
@property int index;

@end
