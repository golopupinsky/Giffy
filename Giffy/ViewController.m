//
//  ViewController.m
//  Giffy
//
//  Created by Sergey Yuzepovich on 08.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    NSString *curDir;
    NSArray *curDirContents;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)previous:(id)sender {
}
- (IBAction)next:(id)sender {
    NSImage* img = [self nextImage];
    if (img != nil) {
        self.imageView.image = img;
    }
}
- (IBAction)zoomOut:(id)sender {
}
- (IBAction)zoomIn:(id)sender {
}

-(void)initCurDirContents{
    
}

-(NSImage*)nextImage{
    if (curDir == nil) {
        return nil;
    }
    
    [self initCurDirContents];
    
    return nil;
}

-(void)filesDropped:(NSArray *)files{
    if(files.count == 1){
        self.imageView.image = [[NSImage alloc]initWithContentsOfFile:files[0]];
    }
}

-(void)keyPress:(NSEvent *)pressEvent{
    NSString* keysPressed = [pressEvent characters];
    if ( [keysPressed isEqualToString:@" "] ){
        NSLog(@"spaceDown");
        [self next:nil];
    }
    if ( [keysPressed isEqualToString:@"\r"] || [keysPressed isEqualToString:@"\n"]){
        NSLog(@"enter");
        [self next:nil];
    }

}

@end
