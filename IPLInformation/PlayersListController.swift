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
    
    func callingServiceFetchData(teamName: String){
        let  arrayOfPlayers = IPLDatabase.getPlayersData(teamName: teamName)
        var players = [Players]()
        if(arrayOfPlayers.count == 0){
            playersListServiceObj?.fetchData(teamName:teamName)
        }
        else{
            for i in 0..<arrayOfPlayers.count{
                let playersObj = Players(playerBattingStyle: arrayOfPlayers[i].playerBattingStyle!, playerBowlingStyle: arrayOfPlayers[i].playerBowlingStyle!, playerDOB: arrayOfPlayers[i].playerDOB!, playerImageUrl: arrayOfPlayers[i].playerImageUrl!, playerName: arrayOfPlayers[i].playerName!, playerNationality: arrayOfPlayers[i].playerNationality!, playerRole: arrayOfPlayers[i].playerRole!)
                players.append(playersObj)
            }
            fetchDataFromService(data: players)
        }
    }
    
    func fetchDataFromService(data:[Players]){
        playersListViewModelObj?.fetchDataFromContollerAndCallReloadFomView(data: data)
    }
    
    
    func fetchImage(imageUrl:String){
        playersListServiceObj?.fetchImage(imageUrl: imageUrl)
    }
    func fetchImagesFromService(image:UIImage){
        playerImageViewModelObj?.fetchImagesFromController(image: image)
    }
}
