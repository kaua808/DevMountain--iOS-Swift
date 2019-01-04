//
//  PlaylistTableTableViewController.m
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "PlaylistTableTableViewController.h"

@interface PlaylistTableTableViewController ()

@property (strong, nonatomic) IBOutlet UITextField *playListTitleTextField;

@end

@implementation PlaylistTableTableViewController

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
- (IBAction)addPlaylistButtonTapped:(id)sender {
    
    [[PlaylistController sharedInstance] createPlayListWithTitle:self.playListTitleTextField.text];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[PlaylistController sharedInstance].playlist count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    Playlist *playlist = [PlaylistController sharedInstance].playlist[indexPath.row];
    cell.textLabel.text = playlist.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[PlaylistController sharedInstance] deletePlaylist: [PlaylistController sharedInstance].playlist[indexPath.row]];
        
        [tableView reloadData];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"toPlaylistDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailPlaylistTableViewController *viewController = segue.destinationViewController;
        Playlist *playlist = [PlaylistController sharedInstance].playlist[indexPath.row];
        viewController.playlist = playlist;
    }
    
}


@end
