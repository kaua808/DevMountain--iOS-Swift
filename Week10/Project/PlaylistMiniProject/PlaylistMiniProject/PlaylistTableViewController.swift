//
//  PlaylistTableViewController.swift
//  PlaylistMiniProject
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    @IBOutlet weak var titlePlaylistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPlaylistButtonPressed(sender: AnyObject) {
        guard let title = titlePlaylistTextField.text else { return }
        PlaylistController.createPlaylist(title)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.playlists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)

        let playlist = PlaylistController.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailPlaylist" {
            guard let songTableViewController = segue.destinationViewController as? SongTableViewController, cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) else { return }
            
            let playlist = PlaylistController.playlists[indexPath.row]
            songTableViewController.playlist = playlist
        }
        
    }
}
