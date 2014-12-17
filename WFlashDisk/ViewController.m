//
//  ViewController.m
//  WFlashDisk
//
//  Created by admin on 14/12/15.
//  Copyright (c) 2014年 XHC. All rights reserved.
//

#import "ViewController.h"
#import "GADBannerView.h"
#import "GADRequest.h"

@interface ViewController ()

@property (nonatomic, strong) GADBannerView  *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _bannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width, 50)];
    [self.view addSubview:_bannerView];
    //_bannerView.backgroundColor = [UIColor redColor];
    self.bannerView.adUnitID = @"ca-app-pub-2555822343548874/4953499948";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    // Enable test ads on simulators.
    //request.testDevices = @[ GAD_SIMULATOR_ID, @"MY_TEST_DEVICE_ID" ];
    [self.bannerView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
