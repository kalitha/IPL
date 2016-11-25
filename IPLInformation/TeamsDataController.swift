//
//  DataFromFirebase.swift
//  IPLInformation
//
//  Created by Kalitha H N on 16/11/16.
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
    
    //makes a rest call when data is absent in local database else fetches data from local database
    func fetchNumOfRows(){
        let  arrayOfTeams = IPLDatabase.getData()
        var teams = [Teams]()
        
        
        if(arrayOfTeams.count == 0){
            teamsServiceObj?.fetchData()
        }
        else{
            for i in 0..<arrayOfTeams.count{
               let teamsObj = Teams(teamImage: arrayOfTeams[i].teamImage!, teamName: arrayOfTeams[i].teamName!)
                teams.append(teamsObj)
            }
            fetchDataFromService(data: teams)
            
        }
    }
    
    
    
    //calling fetchImage() of service class
    func fetchImage(image: [Teams]){
       
        teamsServiceObj?.fetchImages(arrayOfTeams: image)
    }

    func fetchDataFromService(data:[Teams]){
        
        teamsViewModelObj?.fetchReloadFromView(data: data)
    }
    
    
    func fetchImageFromService(image: UIImage, index: Int){
        teamsViewModelObj?.fetchImageFromController(image: image, index: index)
    }
    
    
    }
