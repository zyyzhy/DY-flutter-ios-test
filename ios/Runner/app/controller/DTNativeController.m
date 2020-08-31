//
//  DTNativeController.m
//  Runner
//
//  Created by 大头科技 on 2020/7/29.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "DTNativeController.h"

@interface DTNativeController ()
/** <#注释#> */
@property (nonatomic, strong) UIButton *goFlutterBtn;
@end

@implementation DTNativeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpViewsWithTittle:@"原生第一个页面"];
    [self setUpBtn];
    // Do any additional setup after loading the view.
}
- (void)setUpViewsWithTittle:(NSString *)tittle {
    UIView * navibarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, TSScreenW, IPHONE_NAVIGATIONBAR_HEIGHT)];
    navibarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navibarView];
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, IPHONE_STATUSBAR_HEIGHT, 60, 44);
    [backBtn setImage:[UIImage imageNamed:@"backDay"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [navibarView addSubview:backBtn];
    
    UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, IPHONE_STATUSBAR_HEIGHT, TSScreenW - 120, 44)];
    titleLab.text = tittle;
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor blackColor];
    [navibarView addSubview:titleLab];
}

-(void)setUpBtn{
    _goFlutterBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _goFlutterBtn.frame = CGRectMake(100, 100, 200, 40);
    _goFlutterBtn.backgroundColor = [UIColor blueColor];
    [_goFlutterBtn setTitle:@"跳至flutter结果页" forState:UIControlStateNormal];
    [_goFlutterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_goFlutterBtn addTarget:self action:@selector(goToFlutterResultPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goFlutterBtn];
}
-(void)goToFlutterResultPage{
    [self.navigationController popViewControllerAnimated:NO];
    [[FlutterMethodChannelPlagin shareFlutterMethodChannelPlagin] invokeToDartMethod:@"goToFlutterResultPage" arg:@"218334374" callBackResult:^(id  _Nullable result) {
        if (result) {
            NSLog(@"%@", result);
        }
    }];
}
-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
    
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
