//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/23.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//

#import "ViewController.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldTextDidChange:(id)sender
{
    [self updateBMI];
    [self updateTextField];
}

- (void)updateBMI
{
    self.height = [self.heightTextField.text floatValue];
    self.weight = [self.weightTextField.text floatValue];
    self.BMI = self.weight / (self.height/100 * self.height/100);
}

- (void)updateTextField
{
    [self updateBMITextField];
    [self updateResultTextField];
}

- (void)updateBMITextField
{
    self.BMITextField.text = [NSString stringWithFormat:@"%.2lf", self.BMI];
}

- (void)updateResultTextField
{
    if (self.BMI < 18.5) {
        self.resultTextField.text = @"體重過輕";
    }
    else if (self.BMI >=18.5 && self.BMI < 24.0) {
        self.resultTextField.text = @"健康體位";
    }
    else if (self.BMI >=24.0 && self.BMI < 27.0) {
        self.resultTextField.text = @"快要過重";
    }
    else if (self.BMI >=27.0 && self.BMI < 30.0) {
        self.resultTextField.text = @"輕度肥胖";
    }
    else if (self.BMI >=30.0 && self.BMI < 35.0) {
        self.resultTextField.text = @"中度肥胖";
    }
    else if (self.BMI >= 35.0) {
        self.resultTextField.text = @"重度肥胖";
    }
    else {
        self.resultTextField.text = nil;
    }
}

@end
