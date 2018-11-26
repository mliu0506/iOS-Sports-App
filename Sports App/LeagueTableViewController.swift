//
//  LeagueTableViewController.swift
//  Sports App
//
//  Created by Michael Liu on 2018-11-26.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class LeagueTableViewController: UITableViewController {
    
    
    var resourceName : String?
    var leagueName : [String]!
    var leagueImage : [String]!
    var game : JSON?
    var leagueArray : [JSON]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let file = Bundle(for: AppDelegate.self).path(forResource: resourceName, ofType: "json") {
            let data = NSData(contentsOfFile: file)! as Data
            let json = JSON(data: data)
            self.parseJson(json: json)
        }

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagueName?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath)
        let gameName = leagueName![indexPath.row]
        cell.textLabel?.text = gameName
        cell.imageView?.image = UIImage(named: leagueImage![indexPath.row])
        
        return cell
    }
    func parseJson(json : JSON) {
        leagueName = [String]()
        leagueImage = [String]()
        leagueArray = [JSON]()
        game = JSON()
        
        let leagues = json["leagues"].arrayValue
        for league in leagues {
            leagueName?.append(league["name"].stringValue)
            leagueImage?.append(league["image"].stringValue)
            leagueArray?.append(league)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            let destinationVC = segue.destination as! GamesTableViewController
            game = leagueArray[selectedRow]["games"]
            destinationVC.leagueGames = self.game
        }
    }


}
