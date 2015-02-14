//
//  Document.m
//  Giffy
//
//  Created by Sergey Yuzepovich on 08.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import "Document.h"
#import "ViewController.h"

@interface Document ()

@end

@implementation Document
{
    NSImage *image;
    ViewController *viewController;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
}

- (void)makeWindowControllers {
    NSWindowController *window = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"];
    viewController = (ViewController *) window.contentViewController;
    
    if(image != nil){
        viewController.imageView.image = image;
    }
    
    [self addWindowController:window];
}

-(BOOL)readFromURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError *__autoreleasing *)outError{
    
    image = [[NSImage alloc]initWithContentsOfURL: url];
    
    if(viewController != nil){
        viewController.imageView.image = image;
    }
    
    return YES;
}

@end
