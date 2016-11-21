//
//  Teams.swift
//  IPLInformation
//
//  Created by BridgeLabz Solutions LLP on 17/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class Teams: NSObject {
    var teamImage : String?
    var teamName : String?
    
    init(teamImage: String, teamName: String) {
        self.teamImage = teamImage
        self.teamName = teamName
    }
}
