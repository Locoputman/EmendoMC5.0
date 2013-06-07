//
//  EMCWorldSelectViewController.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCWorldSelectViewController.h"

@interface EMCWorldSelectViewController ()

@end

@implementation EMCWorldSelectViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    syslog(LOG_NOTICE, "- (id)initWithCoder:(NSCoder *)aDecoder");
    self = [self initWithCollectionViewLayout:[[PSTCollectionViewFlowLayout alloc] init]];
    return self;
}

- (id)initWithCollectionViewLayout:(PSTCollectionViewLayout *)layout
{
    syslog(LOG_NOTICE, "- (id)initWithCollectionViewLayout:(PSTCollectionViewLayout *)layout");
    if (self = [super initWithCollectionViewLayout:layout]) {
        [self.collectionView registerClass:[EMCWorldCell class] forCellWithReuseIdentifier:@"worldCell"];
    }
    return self;
}

- (void)viewDidLoad
{
    syslog(LOG_NOTICE, "- (void)viewDidLoad");
    [super viewDidLoad];
    [self.collectionView setBackgroundColor:[UIColor colorWithPatternImage:[MCImageLoader sharedSource].bg128]];
    self.button = nil;
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    syslog(LOG_NOTICE, "- (void)viewDidAppear:(BOOL)animated");
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    syslog(LOG_NOTICE, "- (void)didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    syslog(LOG_NOTICE, "- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath");
    return CGSizeMake(244, 155);
}
- (UIEdgeInsets)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (UIEdgeInsets)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section");
    return UIEdgeInsetsMake(15, 0, 15, 0);
}
- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section");
    return 15;
}
- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section");
    return 15;
}
- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section");
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section");
    return CGSizeMake(0, 0);
}

- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    syslog(LOG_NOTICE, "- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath");
    EMCWorldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"worldCell" forIndexPath:indexPath];
    [cell.layer setBackgroundColor:[UIColor blackColor].CGColor];
    [cell.worldName setBackgroundColor:[UIColor clearColor]];
    [cell.worldName setFont:[UIFont boldSystemFontOfSize:17]];
    [cell.worldName setTextColor:[UIColor whiteColor]];
    [cell.worldName setShadowColor:[UIColor lightGrayColor]];
    [cell.worldName setShadowOffset:CGSizeMake(2, 2)];
    [cell.folderName setBackgroundColor:[UIColor clearColor]];
    [cell.folderName setFont:[UIFont boldSystemFontOfSize:17]];
    [cell.folderName setTextColor:[UIColor whiteColor]];
    [cell.folderName setShadowColor:[UIColor lightGrayColor]];
    [cell.folderName setShadowOffset:CGSizeMake(2, 2)];
    [cell.defaultWorldImage setImage:[MCImageLoader sharedSource].default_world];
    [cell.layer setBorderColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0].CGColor];
    [cell.layer setBorderWidth:2.0];
    MCLevel *thisLevel = [BridgeMCPE levelAtIndex:indexPath.row];
    [cell.worldName setText:[thisLevel levelName]];
    [cell.folderName setText:[[thisLevel.rawPath stringByDeletingLastPathComponent] lastPathComponent]];
    return cell;
}
- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    syslog(LOG_NOTICE, "- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section");
    return [BridgeMCPE worldCount];
}
- (NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView
{
    syslog(LOG_NOTICE, "- (NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView");
    return 1;
}
- (void)collectionView:(PSTCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    syslog(LOG_NOTICE, "- (void)collectionView:(PSTCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath");
    [[EMCSharedData sharedData] setCurrentLevel:[BridgeMCPE levelAtIndex:indexPath.row]];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UITabBarController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"tabController"];
    UINavigationController *navigation = [mainStoryboard instantiateViewControllerWithIdentifier:@"navigationController"];
    syslog(LOG_NOTICE, "TabController: %s", controller.description.UTF8String);
    syslog(LOG_NOTICE, "NavigationController: %s", navigation.description.UTF8String);
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)viewDidUnload
{
    syslog(LOG_NOTICE, "- (void)viewDidUnload");
    [super viewDidUnload];
}

@end
