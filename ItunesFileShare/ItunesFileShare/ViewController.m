//
//  ViewController.m
//  ItunesFileShare
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 uupye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) generateImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(320.0, 200.0), NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect imageRect = CGRectMake(0.0, 0.0, 320, 200) ;
    [[UIColor redColor] setFill] ;
    CGContextFillRect(ctx, imageRect) ;
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext() ;
    UIGraphicsEndImageContext() ;
    return image ;
}

#pragma mark - IBAction
- (IBAction)readFilePath:(id)sender {
    NSString *documentsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *imageFileName = [documentsDir stringByAppendingPathComponent:@"myImage.png"];
    UIImage *image = [self generateImage];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    [fileManager createFileAtPath:imageFileName contents:UIImagePNGRepresentation(image) attributes:nil];
}
- (IBAction)writeFileToItunes:(id)sender {
    NSString *documentsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:documentsDir];
    NSString *fileName;
    while (fileName = [dirEnum nextObject])
    {
        NSLog(@"FileName:%@",fileName);
        NSLog(@"FileFullPath:%@",[documentsDir stringByAppendingPathComponent:fileName]);
    }
}

@end
