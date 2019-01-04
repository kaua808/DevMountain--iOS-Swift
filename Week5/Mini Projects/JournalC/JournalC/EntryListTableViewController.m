//
//  EntryListTableViewController.m
//  JournalC
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "Entry.h"
#import "EntryController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [EntryController sharedController].entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedController].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
    
    
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Entry *entry = [EntryController sharedController].entries[indexPath.row];
        
        
        // EntryDetailViewController *detailViewController = segue.destinationViewController;
        // detailViewController.entry = entry
    }
}


@end
