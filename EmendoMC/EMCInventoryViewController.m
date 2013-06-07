//
//  EMCInventoryViewController.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCInventoryViewController.h"

@interface EMCInventoryViewController ()

@end

@implementation EMCInventoryViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView] reloadData];
    _addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addInventoryItem)];
}

- (void)addInventoryItem
{
    MCInventoryItem *newItem = [[MCInventoryItem alloc] init];
    [newItem setID:264];
    [newItem setCount:255];
    [newItem setDamage:0];
    [[EMCSharedData sharedData].currentLevel addInventoryItem:newItem];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:newItem atIndex:[EMCSharedData sharedData].currentLevel.inventoryCount-1];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    //[self.tabBarController.navigationItem setRightBarButtonItem:self.addButton];
    [[self tableView] reloadData];
}
- (void)viewWillDisappear:(BOOL)animated
{
    // [self.tabBarController.navigationItem setRightBarButtonItem:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[EMCSharedData sharedData].currentLevel inventoryCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMCInventoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inventoryCell" forIndexPath:indexPath];
    MCInventoryItem *thisItem = [[EMCSharedData sharedData].currentLevel inventoryItemAtIndex:indexPath.row];
    [cell.itemCount setText:[NSString stringWithFormat:@"%d", thisItem.count]];
    [cell.itemDamage setText:[NSString stringWithFormat:@"%d", thisItem.damage]];
    
    NSDictionary *all = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"all" ofType:@"plist"]];
    NSString *name = [all objectForKey:[NSString stringWithFormat:@"%d", thisItem.ID]];
    
    [cell.itemImage.layer setMagnificationFilter:kCAFilterNearest];
    [cell.itemImage setImage:[EMCImageLoader imageForName:name]];
    [cell.itemName setText:name];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[[EMCSharedData sharedData] currentLevel] removeInventoryItemAtIndex:indexPath.row];
        [self.tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        MCInventoryItem *newItem = [[MCInventoryItem alloc] init];
        [newItem setID:264];
        [newItem setCount:255];
        [newItem setDamage:0];
        [newItem setSlot:[[EMCSharedData sharedData].currentLevel inventoryCount]+9];
        [[EMCSharedData sharedData].currentLevel addInventoryItem:newItem];
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[EMCSharedData sharedData] setCurrentItem:[[EMCSharedData sharedData].currentLevel inventoryItemAtIndex:indexPath.row]];
    [[EMCSharedData sharedData] setIndex:indexPath.row];
}

@end
