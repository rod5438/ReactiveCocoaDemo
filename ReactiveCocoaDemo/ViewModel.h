//
//  ViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Jason Wu on 2016/3/24.
//  Copyright © 2016年 Jason Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewModel : NSObject

- (void)bindHeightTextField:(UITextField *)heightTextField;
- (void)bindWeightTextField:(UITextField *)weightTextField;
- (void)bindBMITextField:(UITextField *)BMITextField;
- (void)bindResultTextField:(UITextField *)resultTextField;

@end
