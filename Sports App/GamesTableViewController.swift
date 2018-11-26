//
//  GamesTableViewController.swift
//  Sports App
//
//  Created by Michael Liu on 2018-11-26.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {

    
    var leagueGames : JSON?
    var matches : [JSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.matches = nil
        self.tableView.reloadData()
        self.parseJson(json: leagueGames!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  matches?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as! GameTableViewCell
        let homeTeamName = matches[indexPath.row]["home_team_name"].stringValue
        let visitTeamName = matches[indexPath.row]["visit_team_name"].stringValue
        let homeTeamCity = matches[indexPath.row]["home_team_city"].stringValue
        let visitTeamCity = matches[indexPath.row]["visit_team_city"].stringValue
        let homeTeamScore = matches[indexPath.row]["home_team_score"].intValue
        let visitTeamScore = matches[indexPath.row]["visit_team_score"].intValue
        let homeTeamLogo = matches[indexPath.row]["home_team_logo"].stringValue
        let visitTeamLogo = matches[indexPath.row]["visit_team_logo"].stringValue
        let gameTime = matches[indexPath.row]["game_time"].intValue
        let gameState = matches[indexPath.row]["game_state"].stringValue
        
        let homeScoreHidden = (gameState == "Pregame") ? true : false
        let visitScoreHidden = (gameState == "Pregame") ? true : false
        let timeHidden = (gameState == "Final") ? true : false
        
        cell.setHidden(homeScoreHidden: homeScoreHidden, visitScoreHidden: visitScoreHidden, timeHidden: timeHidden)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        cell.homeTeamLogo.image = UIImage(named: homeTeamLogo)
        cell.visitTeamLogo.image = UIImage(named: visitTeamLogo)
        cell.homeTeamCity.text = "\(homeTeamCity) \(homeTeamName)"
        cell.visitTeamCity.text = "\(visitTeamCity) \(visitTeamName)"
        cell.homeTeamScore.text = String(homeTeamScore)
        cell.visitTeamScore.text = String(visitTeamScore)
        cell.gameTime.text = formatter.string(from: Date(timeIntervalSinceNow: TimeInterval(gameTime)))
        
        
        return cell
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        leagueGames = nil
        matches = nil
    }
    
    func parseJson(json : JSON) {
        let games = json.arrayValue
        matches = [JSON]()
        for game in games {
            matches.append(game)
        }
    }


}
