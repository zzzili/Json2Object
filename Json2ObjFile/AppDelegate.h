//
//  AppDelegate.h
//  Json2ObjFile
//
//  Created by zz on 14-6-23.
//  Copyright (c) 2014年 YunFeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)touchCreateFile:(id)sender;
@property (weak) IBOutlet NSTextField *textClass;

@property (weak) IBOutlet NSScrollView *scrollView;

@property (retain) NSTextView *textView;


@end
