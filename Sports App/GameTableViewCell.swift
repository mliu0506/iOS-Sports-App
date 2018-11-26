//
//  GameTableViewCell.swift
//  Sports App
//
//  Created by Michael Liu on 2018-11-26.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var visitTeamLogo: UIImageView!
    
    @IBOutlet weak var homeTeamCity: UILabel!
    
    @IBOutlet weak var visitTeamCity: UILabel!
    
    @IBOutlet weak var homeTeamScore: UILabel!
    
    @IBOutlet weak var visitTeamScore: UILabel!
    
    @IBOutlet weak var gameTime: UILabel!
    
    func setHidden(homeScoreHidden : Bool, visitScoreHidden : Bool, timeHidden : Bool) {
        self.gameTime.isHidden = timeHidden
        self.homeTeamScore.isHidden = homeScoreHidden
        self.visitTeamScore.isHidden = visitScoreHidden
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
