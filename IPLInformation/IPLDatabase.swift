//
//  TeamDatabase.swift
//  IPLInformation
//
//  Created by Kalitha H N on 24/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import  CoreData
class IPLDatabase: NSObject {
    
    class func storeData(teamName: String, teamImageUrl: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let teamsInformation = TeamsInformation(context: context)
        
        teamsInformation.teamName = teamName
        teamsInformation.teamImage = teamImageUrl
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }

    
  class func getData()->[TeamsInformation]{
        var teams = [TeamsInformation]()//since it is a model array we r using ()
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            teams = try context.fetch(TeamsInformation.fetchRequest())
        }catch{
            print("fetching failed")
        }
        return teams
    }
    
    
    class func getPlayersData(teamName: String)->[PlayersInformationDB]{
        var players = [PlayersInformationDB]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            let predicate = NSPredicate(format: "teamName = %@", teamName)
            let fetchReq : NSFetchRequest = PlayersInformationDB.fetchRequest()
            fetchReq.predicate = predicate
            players = try context.fetch(fetchReq)
            
        }catch{
             print("fetching failed")
        }
        return players
    }
    
    class func storePlayersData(playerBattingStyle: String,playerBowlingStyle: String,playerDOB: String, playerImageUrl:String,playerName:String,playerNationality:String,playerRole:String, teamName: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let playersInformation = PlayersInformationDB(context: context)
        
        playersInformation.playerBattingStyle = playerBattingStyle
        playersInformation.playerBowlingStyle = playerBowlingStyle
        playersInformation.playerDOB = playerDOB
        playersInformation.playerImageUrl = playerImageUrl
        playersInformation.playerName = playerName
        playersInformation.playerRole = playerRole
        playersInformation.playerNationality = playerNationality
        playersInformation.teamName = teamName
    
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

    }
    
    
    class func encodeImageBase64(image : UIImage) -> String
    {
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64:String = imageData.base64EncodedString(options:.lineLength64Characters)
        return strBase64
    }
    
    class func decodeImagefromBase64(strBase64 : String)->UIImage
    {
        
        let dataDecoded:NSData = NSData(base64Encoded: strBase64, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
        
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        return decodedimage
    }
    
    
    class func getTeamImage(teamImageUrl: String)->[TeamImge]{
        var teamImages = [TeamImge]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            let predicate = NSPredicate(format: "imageUrl = %@", teamImageUrl)
            let fetchReq : NSFetchRequest = TeamImge.fetchRequest()
             fetchReq.predicate = predicate
            teamImages = try context.fetch(fetchReq)

        }catch{
            print("fetching failed")
        }
      return teamImages
    }
    
  class  func storeTeamImages(teamImageUrl: String, teamImage: UIImage){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let teamImageObj = TeamImge(context: context)
   let convertedImage = self.encodeImageBase64(image: teamImage)
        teamImageObj.image = convertedImage
        teamImageObj.imageUrl = teamImageUrl
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

    }
    
}
