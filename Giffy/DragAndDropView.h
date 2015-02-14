//
//  View.h
//  Giffy
//
//  Created by Sergey Yuzepovich on 14.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol DragAndDropDelegate <NSObject>
-(void)filesDropped:(NSArray*)files;
@end

@interface DragAndDropView : NSView

@property(nonatomic,weak) IBOutlet id<DragAndDropDelegate> delegate;

@end
