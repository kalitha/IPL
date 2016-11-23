//
//  PlayersDataController.swift
//  IPLInformation
//
//  Created by Kalitha H N on 21/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class PlayersListController: NSObject {

    var playersListViewModelObj: PlayersListViewModel?
    var playersListServiceObj: PlayersListService?
    var playerImageViewModelObj: PlayerImageViewModel?
    init(obj: PlayersListViewModel) {
        super.init()
    playersListViewModelObj = obj
        playersListServiceObj = PlayersListService(obj: self)
    }
    init(object: PlayerImageViewModel) {
        super.init()
        playerImageViewModelObj = object
        playersListServiceObj = PlayersListService(obj: self)
    }
//    func fetchNumOfRows(){
//        playersListServiceObj?.fetchData()
//    }
    
    func fetchDataFromService(data:[Players]){
        playersListViewModelObj?.fetchDataFromContollerAndCallReloadFomView(data: data)
    }
    
    func callingServiceFetchData(teamName: String){
        playersListServiceObj?.fetchData(teamName:teamName)
    }
    
    func fetchImage(imageUrl:String){
        playersListServiceObj?.fetchImage(imageUrl: imageUrl)
    }
    func fetchImagesFromService(image:UIImage){
        playerImageViewModelObj?.fetchImagesFromController(image: image)
    }
}
