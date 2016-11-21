//
//  DataFromFirebase.swift
//  IPLInformation
//
//  Created by BridgeLabz Solutions LLP on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class TeamsDataController: NSObject {
    
    var teamsServiceObj : TeamsService?
    var  teamsViewModelObj : TeamsViewModel?
    init(obj:TeamsViewModel) {
        super.init()
        teamsViewModelObj=obj
        teamsServiceObj = TeamsService(obj: self)
    }
    
    func fetchNumOfRows(){
               teamsServiceObj?.fetchData()
    }
    
    func fetchDataFromService(data:[Teams]){
        teamsViewModelObj?.fetchReloadFromView(data: data)
    }
    
    //calling fetchImage() of service class
    func fetchImage(){
        teamsServiceObj?.fetchImages()
    }
    
    func fetchImageFromService(image: UIImage, index: Int){
        teamsViewModelObj?.fetchImageFromController(image: image, index: index)
    }
    
    
    }
