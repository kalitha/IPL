//
//  TeamsService.swift
//  IPLInformation
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import Firebase
import  FirebaseStorage

class TeamsService: NSObject {
     
    var ref: FIRDatabaseReference!
    var teams = [NSDictionary]() //teams is an array of nsdictionary
    
    //var teams :NSDictionary = [:] <-this says teams is only 1 dictionary
    
    var teamsDataControllerObj : TeamsDataController?
    
    var arrayOfTeams = [Teams]() //creating array of model type
    
    
    init(obj:TeamsDataController) {
        teamsDataControllerObj = obj
    }
    
    func fetchData(){
        
        ref = FIRDatabase.database().reference()//responsible to make a call to firebase
        ref.child("teams").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            //            self.teams = (snapshot.value as? NSArray)!
            //            self.teamsDataControllerObj?.fetchDataFromService(data: self.teams)
            self.teams = (snapshot.value) as! [NSDictionary]
            
            for index in 0..<self.teams.count{
                let valueAtEachIndex = self.teams[index] as NSDictionary //valueAtEachIndex is 1 nsdictionary
                let teamImageValue = valueAtEachIndex["team_img_url"] as! String
                let teamNameValue = valueAtEachIndex["team_name"] as! String
                
                //providing teamname and teamimageurl to storeData()
                IPLDatabase.storeData(teamName: teamNameValue, teamImageUrl: teamImageValue)
                
                let teamsObj = Teams(teamImage: teamImageValue, teamName: teamNameValue)
                self.arrayOfTeams.append(teamsObj)
                
            }
            print("count=======",self.arrayOfTeams.count)
            self.teamsDataControllerObj?.fetchDataFromService(data: self.arrayOfTeams as [Teams])
            //array of classobject
            //print("array of teams=",self.arrayOfTeams)
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func fetchImages(arrayOfTeams: [Teams]) {
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://iplinformation-3f8f2.appspot.com")
        
        for i in 0..<arrayOfTeams.count{
            let teamImage = arrayOfTeams[i].teamImage
            
            let fetchedImage = IPLDatabase.getTeamImage(teamImageUrl: teamImage!)
            
            if (fetchedImage.count != 0) {
              let  arrayOfTeamImage = fetchedImage[0]//only 1 image will b present since we r givng 1 url
                
           let decodedImage = IPLDatabase.decodeImagefromBase64(strBase64: arrayOfTeamImage.image!)
                
                self.teamsDataControllerObj?.fetchImageFromService(image: decodedImage , index: i)
            }else{
            let path = storageRef.child(teamImage!)//getting urls to make rest calls
            
            path.data(withMaxSize: 1*1024*1024) {(data,error) -> Void in//we r making rest call here
                if(error != nil){
                    print("error occured")
                }else{
                    let image = UIImage(data: data!)
                    
                   IPLDatabase.storeTeamImages(teamImageUrl: teamImage!, teamImage: image!)
                    self.teamsDataControllerObj?.fetchImageFromService(image: image!, index: i)
                }
                }
            }
        }
    }
}
