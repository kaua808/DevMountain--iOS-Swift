//
//  ViewController.m
//  Objc - find numbers divisible by x
//
//  Created by Kaleo Kim on 3/25/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self devisibleByX:4 y:12];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)devisibleByX:(int)x :(int)y {
    
    for (int i = 0; i < y; i++) {
        if (i % x == 0) {
            NSLog(@"%d, ", i);
        }
    }
    
}

@end
