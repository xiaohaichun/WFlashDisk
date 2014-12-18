//
//  ViewController.m
//  WFlashDisk
//
//  Created by admin on 14/12/15.
//  Copyright (c) 2014年 XHC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AboutViewController.h"
#import "GADBannerView.h"
#import "GADRequest.h"

#define kBlueColor [UIColor colorWithRed:50.0/255.0 green:146.0/255.0 blue:239.0/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, strong) GADBannerView  *bannerView;

@end

@implementation ViewController

- (void)initTopTitleView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44+20)];
    view.backgroundColor = kBlueColor;
    [self.view addSubview:view];
    
    UILabel *viewTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, self.view.bounds.size.width-120, 44)];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    viewTitle.textAlignment = NSTextAlignmentCenter;
    viewTitle.text = @"文件列表";
    [view addSubview:viewTitle];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20,60 , 44);
    [leftBtn setTitle:@"上传" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.view.bounds.size.width - 60, 20,60 , 44);
    [rightBtn setTitle:@"关于" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:rightBtn];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 20+44, self.view.bounds.size.width, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [view addSubview:lineView];
}

- (void)leftBtnPressed
{
    
}

- (void)rightBtnPressed
{
    AboutViewController *aboutView = [[AboutViewController alloc] init];
    aboutView.title = @"关于";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:aboutView];;
    [self presentViewController:nav animated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTopTitleView];
    
    _bannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, 44+21, self.view.bounds.size.width, 50)];
    [self.view addSubview:_bannerView];
    self.bannerView.adUnitID = @"ca-app-pub-2555822343548874/4953499948";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    // Enable test ads on simulators.
    request.testDevices = @[ GAD_SIMULATOR_ID, @"0ca1fbe708b6c3ef0f8ce94e4c0c9aa2" ];
    [self.bannerView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
