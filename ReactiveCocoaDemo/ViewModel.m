//
//  ViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/24.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//

#import "ViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewModel()

@property CGFloat height;
@property CGFloat weight;
@property CGFloat BMI;

@end

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        RAC(self, BMI) = [RACSignal combineLatest:@[RACObserve(self, height), RACObserve(self, weight)] reduce:^id (NSNumber *height, NSNumber *weight) {
            return @([weight floatValue] / powf([height floatValue] / 100, 2));
        }];
    }
    return self;
}

- (void)bindHeightTextField:(UITextField *)heightTextField
{
    RAC(self, height) = [heightTextField.rac_textSignal map:^id(NSString *text) {
        return [NSNumber numberWithFloat:[text floatValue]];
    }];
}
- (void)bindWeightTextField:(UITextField *)weightTextField
{
    RAC(self, weight) = [weightTextField.rac_textSignal map:^id(NSString *text) {
        return [NSNumber numberWithFloat:[text floatValue]];
    }];
}
- (void)bindBMITextField:(UITextField *)BMITextField
{
    RAC(BMITextField, text) = [RACObserve(self, BMI) map:^id(NSNumber *BMI) {
        return [NSString stringWithFormat:@"%.2lf",[BMI floatValue]];
    }];
}
- (void)bindResultTextField:(UITextField *)resultTextField
{
    RAC(resultTextField, text) = [RACObserve(self, BMI) map:^id(NSNumber *BMInumber) {
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

@end
