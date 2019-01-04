//
//  PlaylistDetailViewController.swift
//  CoreDataPlaylist
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var artistField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateViewWithPlaylistDetails(self.playlist!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        if let playlist = playlist, let title = titleField.text, let artist = artistField.text {
            
            PlaylistController.sharedInstance.createSong(title, artist: artist, playlist: playlist)
            titleField.text = ""
            artistField.text = ""
            tableView.reloadData()
        }
    }
    
    func updateViewWithPlaylistDetails(playlist: Playlist) {
        title = playlist.name
        
    }

}

extension PlaylistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        
        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            let song = songs[indexPath.row]
            
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            return songs.count
        } else {
            return 0
        }
        
    }
    
}
