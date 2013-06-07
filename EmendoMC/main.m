//
//  main.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EMCAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        openlog("EmendoMC", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
        int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([EMCAppDelegate class]));
        closelog();
        return retVal;
    }
}
