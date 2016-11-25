//
//  PlayersListService.swift
//  IPLInformation
//
//  Created by Kalitha H N on 21/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import Firebase

class PlayersListService: NSObject {
    var ref: FIRDatabaseReference!
    
    var playersListControllerObj: PlayersListController?
    
    var players = [NSDictionary]()
    
    var arrayOfPlayersInfo = [Players]()
    
    init(obj: PlayersListController ) {
        playersListControllerObj = obj
    }
    
    func  fetchData(teamName: String){
    ref = FIRDatabase.database().reference()//responsible to make a call to firebase
    
    ref.child("players").child(teamName).observeSingleEvent(of: .value, with: { (snapshot) in
   self.players = (snapshot.value) as! [NSDictionary]
    
    for index in 0..<self.players.count{
    let valueAtEachIndex = self.players[index] as NSDictionary //valueAtEachIndex is 1 nsdictionary
    let playerBattingstyleValue = valueAtEachIndex["player_batting_style"] as! String
    let playerBowlingStyleValue  = valueAtEachIndex["player_bowling_style"] as! String
    let playerDOBValue  = valueAtEachIndex["player_dob"] as! String
    let playerImageUrlValue  = valueAtEachIndex["player_img_url"] as! String
    let playerNameValue  = valueAtEachIndex["player_name"] as! String
    let playerRoleValue  = valueAtEachIndex["player_role"] as! String
    let playerNationalityValue  = valueAtEachIndex["player_nationality"] as! String

        
        //storing into database
    IPLDatabase.storePlayersData(playerBattingStyle: playerBattingstyleValue, playerBowlingStyle: playerBowlingStyleValue, playerDOB: playerDOBValue, playerImageUrl: playerImageUrlValue, playerName: playerNameValue, playerNationality: playerNationalityValue, playerRole: playerRoleValue, teamName: teamName)
        
    let playersObj = Players(playerBattingStyle: playerBattingstyleValue, playerBowlingStyle: playerBowlingStyleValue, playerDOB: playerDOBValue, playerImageUrl: playerImageUrlValue, playerName: playerNameValue, playerNationality: playerNationalityValue, playerRole: playerRoleValue)
    self.arrayOfPlayersInfo.append(playersObj)
    }
        self.playersListControllerObj?.fetchDataFromService(data: self.arrayOfPlayersInfo as [Players])
    
    }) { (error) in
    print(error.localizedDescription)
    }

    }
    
    func fetchImage(imageUrl:String) {
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://iplinformation-3f8f2.appspot.com")
        let fetchedImage = IPLDatabase.getTeamImage(teamImageUrl: imageUrl)
        
        if(fetchedImage.count == 0){
        let path = storageRef.child(imageUrl)
        
        path.data(withMaxSize: 1*1024*1024) {(data,error) -> Void in//we r making rest call here
            if(error != nil){
                print("error occured")
            }else{
                let image = UIImage(data: data!)
                IPLDatabase.storeTeamImages(teamImageUrl: imageUrl, teamImage: image!)
                self.playersListControllerObj?.fetchImagesFromService(image: image!)
            }
            }
            
        }else{
            let imageArray = fetchedImage[0]
            
            let decodedImage = IPLDatabase.decodeImagefromBase64(strBase64: imageArray.image!)
            self.playersListControllerObj?.fetchImagesFromService(image: decodedImage)

        }
    }
    
}
