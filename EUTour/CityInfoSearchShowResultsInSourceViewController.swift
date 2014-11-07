//
//  CityInfoSearchShowResultsInSourceViewController.swift
//  EUTour
//
//  Created by Nan on 14/11/7.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class CityInfoSearchShowResultsInSourceViewController: CityInfoSearchResultsViewController {

    // MARK: Properties
    
    // `searchController` is set in viewDidLoad(_:).
    var searchController: UISearchController!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the search controller, but we'll make sure that this SearchShowResultsInSourceViewController
        // performs the results updating.
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        // Make sure the that the search bar is visible within the navigation bar.
        searchController.searchBar.sizeToFit()
        
        // Include the search controller's search bar within the table's header view.
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }

}
