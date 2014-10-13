//
//  LXLUIImageDrawingViewController.m
//  Drawing
//
//  Created by xlliu on 14-9-22.
//  Copyright (c) 2014年 jiuzhou. All rights reserved.
//

#import "LXLUIImageDrawingViewController.h"

@interface LXLUIImageDrawingViewController ()

@end

@implementation LXLUIImageDrawingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"mari.png"];
//    [self display:[self sideBySideWithImage:image]];
    [self display:[self compositedWithImage:image]];
//    [self display:[self halfWithImage:image]];

}

- (void)display:(UIImage *)image
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.center = self.view.center;
    [self.view addSubview:iv];
}

- (UIImage *)sideBySideWithImage:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width * 2, image.size.height), NO, 0);
    [image drawAtPoint:CGPointMake(0, 0)];
    [image drawAtPoint:CGPointMake(image.size.width, 0)];
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return outImage;
}

- (UIImage *) compositedWithImage:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width *2, image.size.height *2), NO, 0);
    [image drawInRect:CGRectMake(0, 0, image.size.width * 2.0, image.size.height * 2.0)];
    [image drawInRect:CGRectMake(image.size.width / 2.0, image.size.height / 2.0 , image.size.height, image.size.width)];
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outImage;
}

- (UIImage *) halfWithImage:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width / 2.0, image.size.height), NO, 0);
    
    [image drawAtPoint:CGPointMake(- image.size.width / 2.0, 0)];
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
