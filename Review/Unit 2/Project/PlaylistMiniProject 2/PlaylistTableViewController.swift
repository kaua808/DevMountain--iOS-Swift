//
//  PlaylistTableViewController.swift
//  PlaylistMiniProject
//
//  Created by admin on 4/6/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    @IBOutlet weak var addPlaylistButton: UIBarButtonItem!
    
    @IBOutlet weak var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPlaylistButtonTapped(_ sender: AnyObject) {
        
        guard let title = inputTextField.text else {return}
        PlaylistController.sharedController.createPlaylist(title)
        tableView.reloadData()
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedController.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.sharedController.playlists[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = playlist.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
           
            PlaylistController.sharedController.deletePlaylist(PlaylistController.sharedController.playlists[(indexPath as NSIndexPath).row])
            
            tableView.reloadData()
            
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPlaylistDetail" {
            guard let destinationViewController = segue.destination as? DetailPlaylistTableViewController,
                      let cell = sender as? UITableViewCell,
                      let indexPath = tableView.indexPath(for: cell) else {return}
            
            let playlist = PlaylistController.sharedController.playlists[(indexPath as NSIndexPath).row]
            destinationViewController.playlist = playlist
        }

    }
    

}
