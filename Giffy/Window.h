//
//  Window.h
//  Giffy
//
//  Created by Sergey Yuzepovich on 15.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol KeysEventsDelegate <NSObject>

-(void)keyPress:(NSEvent*)pressEvent;

@end

@interface Window : NSWindow

@end
