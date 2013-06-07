//
//  EMCImageLoader.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/3/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCImageLoader.h"

@implementation EMCImageLoader

float GUI_BLOCKS_WIDTH = 512;
float ITEMS_WIDTH = 256;
float TERRAIN_WIDTH = 256;

int GUI_BLOCKS_SINGLE_WIDTH = 48;
int ITEMS_SINGLE_WIDTH = 16;
int TERRAIN_SINGLE_WIDTH = 16;

const int GUI_BLOCKS = 0;
const int ITEMS = 1;
const int TERRAIN = 2;

static NSDictionary *imageLoaderRef;

+ (void)initialize
{
    imageLoaderRef = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageLoaderRef" ofType:@"plist"]];
}

+ (UIImage *)imageForName:(NSString *)name
{
    NSDictionary *item = [imageLoaderRef objectForKey:name];
    UIImage *bigImage;
    float ratio;
    int x = [[item objectForKey:@"x"] intValue];
    int y = [[item objectForKey:@"y"] intValue];
    switch ([[item objectForKey:@"image"] intValue]) {
        case GUI_BLOCKS:
            bigImage = [[MCImageLoader sharedSource] gui_blocks];
            ratio = ((float)bigImage.size.width)/GUI_BLOCKS_WIDTH;
            CGRect rect1 = CGRectMake(x*GUI_BLOCKS_SINGLE_WIDTH*ratio, y*GUI_BLOCKS_SINGLE_WIDTH*ratio, GUI_BLOCKS_SINGLE_WIDTH*ratio, GUI_BLOCKS_SINGLE_WIDTH*ratio);
            return [[MCImageLoader sharedSource] imageWithRect:rect1 inImage:bigImage];
            break;
        case ITEMS:
            bigImage = [[MCImageLoader sharedSource] items];
            ratio = ((float)bigImage.size.width)/ITEMS_WIDTH;
            CGRect rect2 = CGRectMake(x*ITEMS_SINGLE_WIDTH*ratio, y*ITEMS_SINGLE_WIDTH*ratio, ITEMS_SINGLE_WIDTH*ratio, ITEMS_SINGLE_WIDTH*ratio);
            return [[MCImageLoader sharedSource] imageWithRect:rect2 inImage:bigImage];
            break;
        case TERRAIN:
            bigImage = [[MCImageLoader sharedSource] terrain];
            ratio = ((float)bigImage.size.width)/TERRAIN_WIDTH;
            CGRect rect3 = CGRectMake(x*TERRAIN_SINGLE_WIDTH*ratio, y*TERRAIN_SINGLE_WIDTH*ratio, TERRAIN_SINGLE_WIDTH*ratio, TERRAIN_SINGLE_WIDTH*ratio);
            return [[MCImageLoader sharedSource] imageWithRect:rect3 inImage:bigImage];
            break;
    }
    return nil;
}

@end
