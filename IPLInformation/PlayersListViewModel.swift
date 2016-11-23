//
//  PlayersViewModel.swift
//  IPLInformation
//
//  Created by Kalitha H N on 21/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class PlayersListViewModel: NSObject {

    var  playersListViewObj:PlayersListView?
    var  playersListControllerObj: PlayersListController?
    var arrayOfplayersInfo = [Players]()
    var count = 0
    //var image = #imageLiteral(resourceName: "download")
    var arrayOfImages = [UIImage]()
    
    init(obj: PlayersListView) {
        super.init()
        playersListViewObj = obj
        playersListControllerObj = PlayersListController(obj: self)
        //callControllerfetchData(teamName: "Gujrat Lions")
    }
    
    func callingControllerfetchData(teamName:String){
        playersListControllerObj?.callingServiceFetchData(teamName: teamName)
    }

    
    func fetchNumberOfRows()->Int{
        
        
        return arrayOfplayersInfo.count
    }
    
    func  fetchDataFromContollerAndCallReloadFomView(data:[Players]){
        arrayOfplayersInfo = data
        
    playersListViewObj?.reload()
    }
    
    func contentAtEachRow(i:Int)->String{
        var contentInIndex : Players?
        
        contentInIndex = arrayOfplayersInfo[i]
        
        print("content in index=",contentInIndex )
        let name = contentInIndex?.playerName
        
        return name!
    }
    
   

    func fetchModel(i:Int)->Players{
        let model = arrayOfplayersInfo[i]
    
        return model
    }
}
