//
//  AppDelegate.m
//  Json2ObjFile
//
//  Created by zz on 14-6-23.
//  Copyright (c) 2014年 YunFeng. All rights reserved.
//

#import "AppDelegate.h"
#import "JSONKit.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.textView = [[NSTextView alloc]initWithFrame:CGRectMake(0, 0, 595, 351)];
    [self.scrollView addSubview:self.textView];
}



- (IBAction)touchCreateFile:(id)sender {
    NSString *jsonStr = self.textView.textStorage.string;
    
    NSDictionary *dic = [self GetDictionaryWithJson:jsonStr];
    if(dic==nil)
    {
        self.textView.string = @"JSON格式错误";
        return;
    }
    NSArray *keyArray = [dic allKeys];
    
    NSString *fileStr=[NSString stringWithFormat:@"@interface %@ : NSObject \r\n",self.textClass.stringValue];
    
    for(int i=0;i<keyArray.count;i++)
    {
        NSString *key = [keyArray objectAtIndex:i];
        NSLog(key);
        id value = [dic objectForKey:key];
        
        if([value isKindOfClass:[NSString class]])
        {
            NSLog(@"string");
            fileStr = [NSString stringWithFormat:@"%@@property (strong,nonatomic) NSString *%@;\r\n",fileStr,key];
        }
        else if([value isKindOfClass:[NSNumber class]])
        {
            NSLog(@"int");
            fileStr = [NSString stringWithFormat:@"%@@property (strong,nonatomic) NSNumber *%@;\r\n",fileStr,key];
        }
        else if([value isKindOfClass:[NSArray class]])
        {
            NSLog(@"int");
            fileStr = [NSString stringWithFormat:@"%@@property (strong,nonatomic) NSArray *%@;\r\n",fileStr,key];
        }
        else
        {
            NSLog(@"string");
            fileStr = [NSString stringWithFormat:@"%@@property (strong,nonatomic) NSString *%@;\r\n",fileStr,key];
        }
    }
    
    fileStr = [fileStr stringByAppendingString:@"@end"];
    NSLog(fileStr);
    [self.textView setString:fileStr];
    
}

-(NSDictionary*)GetDictionaryWithJson:(NSString*)jsonStr
{
    return [jsonStr objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
}
@end
