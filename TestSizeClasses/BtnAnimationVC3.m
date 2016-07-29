//
//  BtnAnimationVC3.m
//  TestSizeClasses
//
//  Created by dean on 2016/7/28.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "BtnAnimationVC3.h"

@interface BtnAnimationVC3 ()
{
    BOOL isBtnClick;
}
@property (weak, nonatomic) IBOutlet UIView *backgroungView;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;



@end

@implementation BtnAnimationVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backgroungView.layer.cornerRadius = self.backgroungView.frame.size.width / 2;
    self.backgroungView.layer.masksToBounds = YES;
    self.myBtn.layer.cornerRadius = self.myBtn.frame.size.width / 2;
    self.myBtn.layer.masksToBounds = YES;
    [self.myBtn addTarget:self action:@selector(viewAnimationBlockWithView:) forControlEvents:UIControlEventTouchUpInside];
    
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, self.backgroungView.frame.size.width - 10, self.backgroungView.frame.size.height - 10)];
//    //    btn.center = self.view.center;
//        btn.backgroundColor = [UIColor greenColor];
//    //    [btn setTitle:@"hi" forState:UIControlStateNormal];
//        btn.layer.cornerRadius = btn.frame.size.width/2;
//        btn.layer.masksToBounds = YES;
//        [self.backgroungView addSubview:btn];
    isBtnClick = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shakeAnimationForView:(UIView *) view

{
    
    //获取到当前View的layer
    
    CALayer *viewLayer = view.layer;
    
    //获取当前View的位置
    
    CGPoint position = viewLayer.position;
    
    //移动的两个终点位置
    
    
    CGPoint beginPosition = CGPointMake(position.x + 10, position.y);
    
    CGPoint endPosition = CGPointMake(position.x - 10, position.y);
    
    //设置动画
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //设置运动形式
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    //设置开始位置
    
    [animation setFromValue:[NSValue valueWithCGPoint:beginPosition]];
    
    //设置结束位置
    
    [animation setToValue:[NSValue valueWithCGPoint:endPosition]];
    
    //设置自动反转
    
    [animation setAutoreverses:YES];
    
    //设置时间
    
    [animation setDuration:.06];
    
    //设置次数
    
    [animation setRepeatCount:HUGE_VAL];
    
    //添加上动画
    
    [viewLayer addAnimation:animation forKey:nil];
    
}

-(void)animationWithView:(UIView *)view
{
    
    CALayer *viewLayer = view.layer;
    
    //获取当前View的位置
    
    CGPoint position = viewLayer.position;
    
    if (isBtnClick == NO) {
        isBtnClick = YES;
        
        
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        
        // 动画选项设定
        animation.duration = 2.5; // 动画持续时间
        animation.repeatCount = 1; // 重复次数
        animation.autoreverses = YES; // 动画结束时执行逆动画
        
        // 缩放倍数
        animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
        animation.toValue = [NSNumber numberWithFloat:0.3]; // 结束时的倍率
        [animation setRepeatCount:HUGE_VAL];
        
        // 添加动画
        [viewLayer addAnimation:animation forKey:@"scale-layer"];
    } else {
        isBtnClick = NO;
        [viewLayer removeAnimationForKey:@"scale-layer"];
    }
    
    
}
//用block的方式改變，因為都繼承自view(用view方式改變，上面是用layer方式產生的動畫)
//view多了個和ueser互動的touch事件，所以如果動畫需要和user互動，最好是用view的方式呈現
//Layer則是會在背景執行，所以不會卡住線程
-(void)viewAnimationBlockWithView:(UIView *)view
{
    [UIView animateWithDuration:3.0 animations:^{
        CGPoint p = self.view.center;
        p.x += 100;
//        self.myBtn.titleLabel.text = @"kkj";
        
        self.myBtn.center = p;
    }];
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
