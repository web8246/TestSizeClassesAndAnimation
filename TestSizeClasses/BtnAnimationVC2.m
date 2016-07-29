//
//  BtnAnimationVC2.m
//  TestSizeClasses
//
//  Created by dean on 2016/7/28.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "BtnAnimationVC2.h"

@interface BtnAnimationVC2 ()
@property (weak, nonatomic) IBOutlet UIView *backgroungView;

@property (weak, nonatomic) IBOutlet UIButton *insideBtn;


@end

@implementation BtnAnimationVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.insideBtn.hidden = YES;
    // Do any additional setup after loading the view.
    
//    self.insideBtn.layer.cornerRadius = self.insideBtn.frame.size.height/4;
//    self.insideBtn.layer.masksToBounds = YES;
    self.backgroungView.layer.cornerRadius = self.backgroungView.frame.size.width / 4;
    self.backgroungView.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, self.backgroungView.frame.size.width - 10, self.backgroungView.frame.size.height - 10)];
////    btn.center = self.view.center;
//    btn.backgroundColor = [UIColor yellowColor];
////    [btn setTitle:@"hi" forState:UIControlStateNormal];
//    btn.layer.cornerRadius = btn.frame.size.width/2;
//    btn.layer.masksToBounds = YES;
//    [self.backgroungView addSubview:btn];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.insideBtn.layer.cornerRadius = self.insideBtn.frame.size.height/4;
//    self.insideBtn.layer.masksToBounds = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
