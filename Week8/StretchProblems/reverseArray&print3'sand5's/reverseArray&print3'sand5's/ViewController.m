//
//  ViewController.m
//  reverseArray&print3'sand5's
//
//  Created by Kaleo Kim on 3/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [self reversedArray:@[@1,@2,@3,@4,@5,@6]]);
    [self reverseArray:@[@1,@2,@3,@4,@5,@6]];
    [self mutiplesOfThreeAndFive:54];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reverseArray:(NSArray*)arr {
    
    NSArray *arr2 = [[arr reverseObjectEnumerator] allObjects];
    NSLog(@"%@", arr2);
}

-(NSArray *)reversedArray:(NSArray *)arr {
    
    NSMutableArray *newArr = [[NSMutableArray alloc] init];
    
    for (NSNumber *num in arr) {
        [newArr insertObject:num atIndex:0];
    }
    
    return newArr;
    
}

- (void)mutiplesOfThreeAndFive:(int)num {
    
    int *sum = 0;
    
    for (int i = 0; i <= num; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            NSLog(@"%d", i);
            //NSNumber *iAsNumber = @([i intValue] + 1);
           // NSNumber *yourNumber = [NSNumber numberWithInt:i];
            sum = sum + i;
        }
    }
    
    NSLog(@"%i", sum);
    
}
@end












