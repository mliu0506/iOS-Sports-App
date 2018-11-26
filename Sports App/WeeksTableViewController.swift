//
//  WeeksTableViewController.swift
//  Sports App
//
//  Created by Michael Liu on 2018-11-26.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class WeeksTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            
            if let destinationVC = segue.destination as? LeagueTableViewController {
                
                //if first row is selected, return sports_week_1.json else sports_week_2.json
                destinationVC.resourceName = (selectedRow  == 0) ? "sports_week_1" : "sports_week_2"
            }
        }
    }
}
