//
//  EMCItemListViewController.h
//  EmendoMC
//
//  Created by Silas Schwarz on 5/12/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMCSharedData.h"

@interface EMCItemListViewController : UITableViewController {
    NSArray *allItems;
    NSArray *searchResults;
    NSNumber *itemID;
    NSIndexPath *currentAll;
    NSIndexPath *currentSearch;
}

@property (strong) NSIndexPath *currentAll;
@property (strong) NSIndexPath *currentSearch;

@end
