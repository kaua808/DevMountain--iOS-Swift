//
//  ViewController.m
//  Obj-C FizzBuzz
//
//  Created by Kaleo Kim on 3/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self FizzBuzz:100];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)FizzBuzz:(int)num {
    
    for (int i = 1; i <= num; i++) {
        
        if (i % 3 == 0) {
            NSLog(@"Dev");
        } else if (i % 5 == 0) {
            NSLog(@"Mtn");
        } else if (i % 3 == 0 && i % 5 == 0) {
            NSLog(@"DevMtn");
        } else {
            NSLog(@"%d", i);
        }
        
    }
    
}

//- (int)fibNum:(int)num {
//    
//    if (num <= 1) {
//        return num;
//    } else {
//        return fibonacci(num - 1) + fibonacci(num - 2);
//    }
//    
//}
//
//func fibonacci(number: Int) -> (Int) {
//    
//    if number <= 1 {
//        return number
//    } else {
//        return fibonacci(number - 1) + fibonacci(number - 2)
//    }
//}
//
//var fibNumber = fibonacci(8)
//print("Fibonacci number is: \(fibNumber)")



@end
