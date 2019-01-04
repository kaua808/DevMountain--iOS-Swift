//
//  StudentTableViewController.m
//  ObjectiveCPractice
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "StudentTableViewController.h"
#import "ObjectiveCPractice-Bridging-Header.h"

@interface StudentTableViewController ()

@end

@implementation StudentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"studetnAdded" object:nil];
}

-(void)reloadTableView {
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [StudentController sharedInstance].students.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = [StudentController sharedInstance].students[indexPath.row];
    
    cell.textLabel.text = student.name;
    cell.detailTextLabel.text = student.age;
    
    return cell;
}

- (IBAction)addButtonTapped:(id)sender {
    
    UIAlertController *alert = [AlertController addStudentAlert];
    [self presentationController:alert animated:true]
    
}

@end

















