//
//  LXLRenderingViewController.m
//  Drawing
//
//  Created by xlliu on 14-9-19.
//  Copyright (c) 2014年 jiuzhou. All rights reserved.
//

#import "LXLRenderingViewController.h"

@interface LXLRenderingViewController ()

@end

@implementation LXLRenderingViewController

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
    
    //在view平排显示两个image，第二个image改变为红色，如果iamge背景不是透明，将显示一个红色色块。
    UIImage *image = [UIImage imageNamed:@"mari.png"];
    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    UIImageView *iv = [[UIImageView alloc] init];
    UIImageView *tv = [[UIImageView alloc] init];
    tv.tintColor = [UIColor redColor];

    iv.translatesAutoresizingMaskIntoConstraints = NO;
    tv.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:iv];
    [self.view addSubview:tv];
    
    id tl = self.topLayoutGuide;
    id bl = self.bottomLayoutGuide;
    
    NSDictionary *vs = NSDictionaryOfVariableBindings(iv,tv,tl,bl);
    NSDictionary *ms = @{@"w": @(image.size.width),
                         @"h":@(image.size.height)};
    
    [self.view
     addConstraints:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"H:|-[iv(w)]-[tv(w)]-|"
      options:0
      metrics:ms
      views:vs]];
    [self.view
     addConstraints:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"V:[tl][iv(h)]|"
      options:0
      metrics:ms
      views:vs]];
    
    [self.view
     addConstraints:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"V:[tl][tv(h)]|"
      options:0
      metrics:ms
      views:vs]];
    
    iv.image = image;
    tv.image = templateImage;
    
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
