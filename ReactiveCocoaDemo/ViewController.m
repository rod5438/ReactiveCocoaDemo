//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/23.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//
// Update to revision
#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController () <UITextFieldDelegate>

@property IBOutlet UITextField *heightTextField;
@property IBOutlet UITextField *weightTextField;
@property IBOutlet UITextField *BMITextField;
@property IBOutlet UITextField *resultTextField;

@property ViewModel *BMIViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.BMIViewModel = [[ViewModel alloc] init];
    [self.BMIViewModel bindHeightTextField:self.heightTextField];
    [self.BMIViewModel bindWeightTextField:self.weightTextField];
    [self.BMIViewModel bindBMITextField:self.BMITextField];
    [self.BMIViewModel bindResultTextField:self.resultTextField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
