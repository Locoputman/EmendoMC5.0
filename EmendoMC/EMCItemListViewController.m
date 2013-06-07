//
//  EMCItemListViewController.m
//  EmendoMC
//
//  Created by Silas Schwarz on 5/12/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCItemListViewController.h"

@interface EMCItemListViewController ()

@end

@implementation EMCItemListViewController

@synthesize currentAll;
@synthesize currentSearch;

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
    allItems = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"itemList" ofType:@"plist"]];
    
    //UIImage *button = [[UIImage imageNamed:@"button"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 6, 5)];
    id barButtonAppearanceInSearchBar = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil];
//    
//    [barButtonAppearanceInSearchBar setBackgroundImage:button forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [barButtonAppearanceInSearchBar setTitleTextAttributes:@{
//                                      UITextAttributeFont : [UIFont systemFontOfSize:15],
//                                 UITextAttributeTextColor : [UIColor blackColor]
//     } forState:UIControlStateNormal];
    [barButtonAppearanceInSearchBar setTitle:@"Done"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    return YES;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]){
        rows = [searchResults count];
    }
    else{
        rows = [allItems count];
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]){
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [allItems objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
    
    searchResults = [allItems filteredArrayUsingPredicate:resultPredicate];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *reverseItemList = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reverseItemList" ofType:@"plist"]];
    if (tableView == self.tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        if (currentAll) {
//            [[tableView cellForRowAtIndexPath:currentAll] setAccessoryType:UITableViewCellAccessoryNone];
//        }
//        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
//        currentAll = indexPath;
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        if (currentSearch) {
//            [[tableView cellForRowAtIndexPath:currentSearch] setAccessoryType:UITableViewCellAccessoryNone];
//        }
//        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
//        currentSearch = indexPath;
    }
    [[EMCSharedData sharedData].currentItem setID:[[reverseItemList objectForKey:[tableView cellForRowAtIndexPath:indexPath].textLabel.text] shortValue]];
    [[EMCSharedData sharedData].currentLevel setInventoryItem:[EMCSharedData sharedData].currentItem atIndex:[EMCSharedData sharedData].index];
}

@end
