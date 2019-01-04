//
//  WordListTableViewController.swift
//  FuzzySearch2
//
//  Created by James Pacheco on 3/30/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class WordListTableViewController: UITableViewController, UISearchResultsUpdating {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        WordController.createWordList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WordController.words.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath)
        let word = WordController.words[indexPath.row]
        cell.textLabel?.text = word.word

        return cell
    }
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsController")
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else {return}
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a word..."
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.sizeToFit()
        definesPresentationContext = true
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text?.lowercaseString else {return}
        let resultsController = searchController.searchResultsController as? SearchResultsTableViewController
        resultsController?.dataSource = WordController.words.filter({$0.word.lowercaseString.containsString(searchTerm)})
        resultsController?.tableView.reloadData()
    }
}