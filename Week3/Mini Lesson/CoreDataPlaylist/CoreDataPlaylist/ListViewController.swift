//
//  ListViewController.swift
//  CoreDataPlaylist
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        if nameField.text?.isEmpty != true {
            PlaylistController.sharedInstance.createPlaylist(nameField.text!)
            nameField.text = ""
            tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        
        if let indexPath = tableView.indexPathForCell(cell) {
            let playlist = PlaylistController.sharedInstance.playlists![indexPath.row]
            let vc = segue.destinationViewController as! PlaylistDetailViewController
            vc.playlist = playlist
        }
    }

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        if let playlists = PlaylistController.sharedInstance.playlists {
            let playlist = playlists[indexPath.row]
            
            cell.textLabel?.text = playlist.name
            
            if let songs = playlist.songs {
                cell.detailTextLabel?.text = "\(songs.count) songs"
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let playlists = PlaylistController.sharedInstance.playlists {
            return playlists.count
        } else {
            return 0
        }
        
        //return let playlists = PlaylistController.sharedInstance.playlists.count
    }
    
    
    
}








