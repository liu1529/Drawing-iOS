//
//  LXLCGImageDrawingViewController.m
//  Drawing
//
//  Created by xlliu on 14-9-22.
//  Copyright (c) 2014年 jiuzhou. All rights reserved.
//

#import "LXLCGImageDrawingViewController.h"

@interface LXLCGImageDrawingViewController ()

@end

@implementation LXLCGImageDrawingViewController

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
    
    [self display:[self splitImage:image]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)display:(UIImage *)image
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.center = self.view.center;
    [self.view addSubview:iv];
}

- (UIImage *)splitImage:(UIImage *)image
{
    CGSize sz = image.size;
    CGImageRef imageCG = image.CGImage;
    CGSize szCG = CGSizeMake(CGImageGetWidth(imageCG), CGImageGetHeight(imageCG));
    CGImageRef left = CGImageCreateWithImageInRect(
                                                    imageCG,
                                                    CGRectMake(0, 0, szCG.width / 2.0, szCG.height));
    CGImageRef right = CGImageCreateWithImageInRect(
                                                     imageCG,
                                                     CGRectMake(szCG.width / 2.0, 0, szCG.width / 2.0, szCG.height));
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width * 1.5, sz.height), NO, 0);
   
    [[UIImage imageWithCGImage:left scale:image.scale orientation:UIImageOrientationUp]
        drawAtPoint:CGPointMake(0, 0)];
    [[UIImage imageWithCGImage:right scale:image.scale orientation:UIImageOrientationUp]
        drawAtPoint:CGPointMake(sz.width, 0)];
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(left);
    CGImageRelease(right);
    
    return outImage;
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
