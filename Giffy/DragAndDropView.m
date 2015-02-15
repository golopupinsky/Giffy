//
//  View.m
//  Giffy
//
//  Created by Sergey Yuzepovich on 14.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import "DragAndDropView.h"

@implementation DragAndDropView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self registerForDraggedTypes:[NSArray arrayWithObjects: NSColorPboardType, NSFilenamesPboardType, nil]];
    }
    return self;
}

-(NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *draggedFilePaths = [pboard propertyListForType:NSFilenamesPboardType];
    
    for (NSString* file in draggedFilePaths) {
        if(![[file pathExtension] isEqualToString:@"gif"] ){
            return NSDragOperationNone;
        }
    }
    
    return NSDragOperationEvery;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender  {
    return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSArray *droppedItems = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    [self.delegate filesDropped:droppedItems];
    return YES;
}

@end
