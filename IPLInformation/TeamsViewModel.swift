//
//  TeamsViewModel.swift
//  IPLInformation
//
//  Created by BridgeLabz Solutions LLP on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class TeamsViewModel: NSObject {
    var teamInformationObj :TeamInformation?
    var teamsDataControllerObj :TeamsDataController?
    var arrayOfTeams = [Teams]()
    var count = 0
    var image = #imageLiteral(resourceName: "cherry")
    var arrayOfImages = [UIImage]()
    
    init(obj: TeamInformation) {
       super.init()
        teamInformationObj=obj
        teamsDataControllerObj = TeamsDataController(obj:self)
      
    }
    
    func fetchNumberOfRows()->Int{
        
        
        if(arrayOfTeams.count==0){//when arrayOfTeams.count=0 then make a rest call
            if(self.count==0){
            teamsDataControllerObj?.fetchNumOfRows()
                count += 1
            }
        }
        
        return arrayOfTeams.count
    }


    func fetchReloadFromView(data : [Teams]){
        arrayOfTeams = data// here the data is taken from the i/p arg and stors in arrayOfTeams
        for i in 0..<self.arrayOfTeams.count{
            arrayOfImages.append(self.image)
            
        }
        fetchImage()
        teamInformationObj?.reload()
            }
    
    func contentAtEachRow(i:Int)->String{
        var contentInIndex : Teams?
        
        contentInIndex = arrayOfTeams[i]
        
        print("content in index=",contentInIndex )
        let name = contentInIndex?.teamName
        
        return name!
    }
    
    //calling fetchImages() of service class
    func fetchImage(){
        teamsDataControllerObj?.fetchImage()
        
      
    }

    //getting images from service class
    func fetchImageFromController(image: UIImage, index: Int){
     //self.image = image
        arrayOfImages[index] = image
//        arrayOfImages.insert(image, at: index)
        teamInformationObj?.reload()
            }

    func fetchEachImage(i:Int)->UIImage{
        //var imageInIndex : UIImage
//        let isIndexValid = arrayOfImages.indices.contains(i)
//    
//        if (isIndexValid == false) {
//         return self.image
//        }
        return arrayOfImages[i]
    }
    
   }