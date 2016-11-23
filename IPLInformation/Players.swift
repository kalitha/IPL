//
//  Players.swift
//  IPLInformation
//
//  Created by Kalitha H N on 22/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class Players: NSObject {

    var playerBattingStyle : String?
    var playerBowlingStyle : String?
    var playerDOB : String?
    var playerImageUrl : String?
    var playerName : String?
    var playerNationality : String?
    var playerRole :String?
    
    init(playerBattingStyle : String, playerBowlingStyle : String,playerDOB: String , playerImageUrl:String,playerName: String,playerNationality: String,playerRole: String) {
        self.playerBattingStyle = playerBattingStyle
        self.playerDOB = playerDOB
        self.playerBowlingStyle = playerBowlingStyle
        self.playerName = playerName
        self.playerRole = playerRole
        self.playerImageUrl = playerImageUrl
        self.playerNationality = playerNationality
    }
}
