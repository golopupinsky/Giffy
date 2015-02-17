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
        [(id<KeysEventsDelegate>)self.contentViewController keyPress:theEvent];
    }
    else{
        [super sendEvent:theEvent];
    }
}

@end
