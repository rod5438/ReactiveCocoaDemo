//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/23.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//
// Update to revision
#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController () <UITextFieldDelegate>

@property IBOutlet UITextField *heightTextField;
@property IBOutlet UITextField *weightTextField;
@property IBOutlet UITextField *BMITextField;
@property IBOutlet UITextField *resultTextField;

@property CGFloat height;
@property CGFloat weight;
@property CGFloat BMI;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RAC(self, height) = [self.heightTextField.rac_textSignal map:^id(NSString *text) {
        return [NSNumber numberWithFloat:[text floatValue]];
    }];
    RAC(self, weight) = [self.weightTextField.rac_textSignal map:^id(NSString *text) {
        return [NSNumber numberWithFloat:[text floatValue]];
    }];
    RAC(self, BMI) = [RACSignal combineLatest:@[RACObserve(self, height), RACObserve(self, weight)] reduce:^id (NSNumber *height, NSNumber *weight) {
        return @([weight floatValue] / powf([height floatValue] / 100, 2));
    }];
    RAC(self.BMITextField, text) = [RACObserve(self, BMI) map:^id(NSNumber *BMI) {
        return [NSString stringWithFormat:@"%.2lf",[BMI floatValue]];
    }];
    RAC(self.resultTextField, text) = [RACObserve(self, BMI) map:^id(NSNumber *BMInumber) {
        NSString *result;
        CGFloat BMI = [BMInumber floatValue];
        if (BMI < 18.5) {
            result = @"體重過輕";
        }
        else if (BMI >=18.5 && BMI < 24.0) {
            result = @"健康體位";
        }
        else if (BMI >=24.0 && BMI < 27.0) {
            result = @"快要過重";
        }
        else if (BMI >=27.0 && BMI < 30.0) {
            result = @"輕度肥胖";
        }
        else if (BMI >=30.0 && BMI < 35.0) {
            result = @"中度肥胖";
        }
        else if (BMI >= 35.0) {
            result = @"重度肥胖";
        }
        else {
            result = nil;
        }
        return result;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
