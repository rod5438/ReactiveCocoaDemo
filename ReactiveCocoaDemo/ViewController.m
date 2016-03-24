//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/23.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property IBOutlet UITextField *height;
@property IBOutlet UITextField *weight;
@property IBOutlet UITextField *BMI;
@property IBOutlet UITextField *result;

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
    [self updateBMITextField];
}

- (void)updateBMITextField
{
    CGFloat height = [self.height.text floatValue];
    CGFloat weight = [self.weight.text floatValue];
    CGFloat BMI = weight / (height/100 * height/100);
    self.BMI.text = [NSString stringWithFormat:@"%.2lf", BMI];
}

@end
