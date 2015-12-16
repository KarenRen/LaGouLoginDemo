//
//  ViewController.m
//  AutoLayoutAnimation
//
//  Created by QC.L on 15/12/15.
//  Copyright © 2015年 QC.L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLineConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLineConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerLoginViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerDengluConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 缩放比例变化
    self.logoImageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    // 位置变化
    self.logoImageView.transform = CGAffineTransformMakeTranslation(0, -500);
    // 约束动画
    self.registerWidthConstraint.constant = 0;
    
    // line
    self.leftLineConstraint.constant = 120;
    self.rightLineConstraint.constant = 120;
    self.centerLoginViewConstraint.constant = -350;
    self.centerDengluConstraint.constant = 350;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [UIView animateWithDuration:1 animations:^{
//       //CGAffineTransformIdentity 恢复原样
//        self.logoImageView.transform = CGAffineTransformIdentity;
//    }];
    // 约束的修改是重新布局的
    self.registerWidthConstraint.constant = 102;
    self.leftLineConstraint.constant = 8;
    self.rightLineConstraint.constant = 8;
    self.centerLoginViewConstraint.constant = 0;
    self.centerDengluConstraint.constant = 0;
    
    [UIView animateWithDuration:2 delay:0.5 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        //CGAffineTransformIdentity 恢复原样
        self.logoImageView.transform = CGAffineTransformIdentity;
        // 重新布局
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
