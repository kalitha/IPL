//
//  PlayerImageViewModel.swift
//  IPLInformation
//
//  Created by Kalitha H N on 23/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class PlayerImageViewModel: NSObject {
    var playerInformationViewObj : PlayerInformationView?
    var playersListControllerObj : PlayersListController?
    var arrayOfImages = [UIImage]()
    
    init(obj: PlayerInformationView) {
        super.init()
        
        playerInformationViewObj = obj
        playersListControllerObj = PlayersListController(object: self)

    }
    //calling fetchImage() of service
    func fetchPlayerImage(imageUrl: String){
        playersListControllerObj?.fetchImage(imageUrl: imageUrl)
    }
    
    func fetchImagesFromController(image:UIImage){
         playerInformationViewObj?.fetchParticularImage(image: image)
       }
    
}
