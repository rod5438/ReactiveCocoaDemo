//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/23.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property IBOutlet UISlider *MVC_Slider;
@property IBOutlet UILabel *MVC_Label;

@property IBOutlet UISlider *MVVM_Slider;
@property IBOutlet UILabel *MVVM_Label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(UISlider *)sender
{
    NSString *displayNumber = [NSString stringWithFormat:@"%.4lf", sender.value];
    self.MVC_Label.text = displayNumber;
}

@end
