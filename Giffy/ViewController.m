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
    NSString *curFile;
    NSArray *curDirFilePaths;
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
    curDirFilePaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:curDir error:nil];
}

-(NSImage*)nextImage{
    [self initCurDirContents];
    
    if( curDirFilePaths != nil && curDirFilePaths.count != 0){
        NSUInteger curIdx = [curDirFilePaths indexOfObject:curFile];
        NSString *path = @"";

        while (![path hasSuffix:@".gif"]) {
            curIdx = (curIdx + 1) % curDirFilePaths.count;
            path = curDirFilePaths[curIdx];
        }
    
        if(path != nil){
            curFile = path;
            return [[NSImage alloc]initWithContentsOfFile: [curDir stringByAppendingPathComponent:path]];
        }
    }
    
    return nil;
}

-(void)filesDropped:(NSArray *)files{
    if(files.count == 1){
        self.imageView.image = [[NSImage alloc]initWithContentsOfFile:files[0]];
        curDir = [files[0] stringByDeletingLastPathComponent];
        curFile = files[0];
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
