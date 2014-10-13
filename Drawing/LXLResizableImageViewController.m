//
//  LXLResizableImageViewController.m
//  Drawing
//
//  Created by xlliu on 14-9-19.
//  Copyright (c) 2014年 jiuzhou. All rights reserved.
//

#import "LXLResizableImageViewController.h"

@interface LXLResizableImageViewController ()

@end

@implementation LXLResizableImageViewController

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
    
    //view 的大小会根据image大小自动调整
//    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mari.png"]];
//    [self.view addSubview:iv];
//    iv.center = CGPointMake(
//                            CGRectGetMidX(iv.superview.bounds),
//                            CGRectGetMidY(iv.superview.bounds));
//    iv.frame = CGRectIntegral(iv.frame);
    
    //这儿使用绝对frame大小，防止image重设view的尺寸
    UIImage *image = [UIImage imageNamed:@"mari.png"];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width * 2, image.size.height)];
    
    [self.view addSubview:iv];
    
    iv.center = CGPointMake(
                            CGRectGetMidX(iv.superview.bounds),
                            CGRectGetMidY(iv.superview.bounds));
    iv.contentMode = UIViewContentModeScaleToFill;
   
    
    
    //image 两个image平铺在view上面
//    UIImage *imageTiled = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    
    //
//    UIImage *imageTiled = [image resizableImageWithCapInsets:
//                           UIEdgeInsetsMake(image.size.height / 4,
//                                            image.size.width / 4,
//                                            image.size.height / 4,
//                                            image.size.width / 4)
//                            resizingMode:UIImageResizingModeTile];
    
//    UIImage *imageTiled = [image resizableImageWithCapInsets:
//                           UIEdgeInsetsMake(image.size.height / 4,
//                                            image.size.width / 4,
//                                            image.size.height / 4,
//                                            image.size.width / 4)
//                            resizingMode:UIImageResizingModeStretch];
    
    UIImage* imageTiled = [image resizableImageWithCapInsets:
                         UIEdgeInsetsMake(image.size.height/2.0 - 1,
                                          image.size.width/2.0 - 1,
                                          image.size.height/2.0 - 1,
                                          image.size.width/2.0 - 1)
                        resizingMode: UIImageResizingModeStretch];
    
    
    iv.image = imageTiled;
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
