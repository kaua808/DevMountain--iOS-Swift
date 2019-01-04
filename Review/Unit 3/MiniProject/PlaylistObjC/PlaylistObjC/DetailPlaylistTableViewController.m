//
//  DetailPlaylistTableViewController.m
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "DetailPlaylistTableViewController.h"

@interface DetailPlaylistTableViewController ()

@property (strong, nonatomic) IBOutlet UITextField *songNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *artistNameTextField;

@end

@implementation DetailPlaylistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addSongButtonTapped:(id)sender {
    
    [[PlaylistController sharedInstance] addSongWithTitle:self.songNameTextField.text andArtist:self.artistNameTextField.text toPLaylist:self.playlist];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.playlist.songs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistDetailCell" forIndexPath:indexPath];
    
    Song *song = self.playlist.songs[indexPath.row];
    
    cell.textLabel.text = song.name;
    cell.detailTextLabel.text = song.artistName;
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[PlaylistController sharedInstance] seleteSong:self.playlist.songs[indexPath.row] fromPLaylist:self.playlist];
        
        [tableView reloadData];
    }
}

@end
