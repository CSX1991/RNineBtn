//
//  ViewController.m
//  RhombDemo
//
//  Created by Csx on 15/12/28.
//  Copyright © 2015年 Wise Sight. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor= [UIColor orangeColor];
    
    UIView * mainViewbg = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 70*3, 70*3)];
    mainViewbg.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:mainViewbg];
    
    UIView * mainView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 70*3, 70*3)];
    mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainView];
    [mainView setTransform:CGAffineTransformMakeRotation(M_PI_4)];

    for (int i = 0; i<3; i++) {
        for (int j = 0; j<3; j++) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(2+i%3*70,2+j%3*70, 66, 66);
            btn.tag = 1000+i+j;
            [btn addTarget:self action:@selector(imgClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor redColor];

            UILabel * llll = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 66, 66)];
            llll.text = [NSString stringWithFormat:@"第%d个",i+j*3];
            llll.backgroundColor = [UIColor clearColor];
            llll.textColor = [UIColor whiteColor];
            llll.textAlignment = NSTextAlignmentCenter;
            [llll setTransform:CGAffineTransformMakeRotation(-M_PI_4)];
            [btn addSubview:llll];
            
            [mainView addSubview:btn];
            
        }
    }
}
-(void)imgClicked:(UIButton*)btn
{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        btn.backgroundColor = [UIColor grayColor];
    }else
        btn.backgroundColor =  [UIColor redColor];
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
