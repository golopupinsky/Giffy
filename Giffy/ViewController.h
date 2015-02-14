//
//  ViewController.h
//  Giffy
//
//  Created by Sergey Yuzepovich on 08.02.15.
//  Copyright (c) 2015 Sergey Yuzepovich. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DragAndDropView.h"

@interface ViewController : NSViewController<DragAndDropDelegate>

@property(nonatomic,strong) IBOutlet NSImageView *imageView;

@end

