//
//  DetailPlaylistTableViewController.swift
//  PlaylistMiniProject
//
//  Created by admin on 4/6/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class DetailPlaylistTableViewController: UITableViewController {
    
    var playlist: Playlist?
    
    var songs: [Song] {
        guard let playlist = playlist else {return []}
        return Array(playlist.song) as? [Song] ?? []
    }
    
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addSongButtonTapped(_ sender: AnyObject) {
        guard let playlist = playlist,
                  let songTitle = songNameTextField.text,
                  let artistName = artistNameTextField.text else {return}
        SongController.createSong(songTitle, artist: artistName, playlist: playlist)
        //SongController.addSongToPlaylist(song, playlist: playlist)
        tableView.reloadData()
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //guard let playlist = playlist else {return 0}
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistDetailCell", for: indexPath)
    
            let song = songs[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        
        
        return cell
    }
    

}
