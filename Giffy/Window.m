//
//  Window.m
//  Giffy
//
//  Created by Sergey Yuzepovich on 15.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import "Window.h"

@implementation Window

- (void)sendEvent:(NSEvent *)theEvent
{
    if(theEvent.type == NSKeyDown){
        NSString* keysPressed = [theEvent characters];
        if ( [keysPressed isEqualToString:@" "] ){
            NSLog(@"spaceDown");
            return;
        }
        if ( [keysPressed isEqualToString:@"\r"] || [keysPressed isEqualToString:@"\n"]){
            NSLog(@"enter");
            return;
        }
    }
    else{
        [super sendEvent:theEvent];
    }
}

@end
