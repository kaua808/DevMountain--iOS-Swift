//
//  ViewController.m
//  Objc - highestNumInArray
//
//  Created by Kaleo Kim on 3/22/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@1, @2, @3, @4, @5];
    
    [self highestNum];
    [self highestNumThatTakesIn:arr];
    [self builtInMaxValue];
    [self secondHighest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)highestNum {
    NSArray *arr = @[@1, @2, @10, @4, @5];
    NSNumber *placeHolder = 0;
    
    for (NSNumber *num in arr){

        if (num > placeHolder) {
            placeHolder = num;
        }

    }
    
    NSLog(@"%@", placeHolder);
    
}

- (void)highestNumWithSecondHighest {
    NSArray *arr = @[@1, @2, @10, @4, @5];
    NSNumber *highest = 0;
    NSNumber *secondHIghest = 0;
    
    for (NSNumber *num in arr){
        
        if (num > highest) {
            secondHIghest = highest;
            highest = num;
            
        } else if (num > secondHIghest) {
            secondHIghest = num;
        }
        
    }
    
    NSLog(@"%@ nad %@", highest, secondHIghest);
    
}

- (void)highestNumThatTakesIn:(NSArray*)arr {
    NSNumber *placeHolder = 0;
    
    for (NSNumber *num in arr){
        
        if (num > placeHolder) {
            placeHolder = num;
        }
        
    }
    
    NSLog(@"%@", placeHolder);
    
}


- (void)builtInMaxValue {
    NSArray *arr = @[@1, @2, @10, @4, @5];
    
    NSNumber * max = [arr valueForKeyPath:@"@max.intValue"];
    NSLog(@"%@", max);
    
}

- (void)secondHighest {
    NSArray  *numbers = @[@2,@1,@3,@5,@30,@20,@1,@2,@4,@5];
    
    NSSet *numberSet = [NSSet setWithArray:numbers];
    
    NSArray *sortedNumbers = [[numberSet allObjects] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO] ]];
    
    NSNumber *secondHighest;
    
    if ([sortedNumbers count] > 1){
        secondHighest = sortedNumbers[1];
    }
    
    NSLog(@"%@", secondHighest);
}








@end
