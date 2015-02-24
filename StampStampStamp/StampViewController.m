//
//  StampViewController.m
//  StampStampStamp
//
//  Created by Tawatchai Sunarat on 2/24/15.
//  Copyright (c) 2015 pddk. All rights reserved.
//

#import "StampViewController.h"

@interface StampViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation StampViewController

#pragma mark - initial

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.stamp;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - screen

@end
