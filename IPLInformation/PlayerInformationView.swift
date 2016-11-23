//
//  PlayerInformationViewController.swift
//  IPLInformation
//
//  Created by Kalitha H N on 22/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class PlayerInformationView: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var BowlingStyle: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    
    var playersInfo: Players?//storing single model
    //var playerInformationViewObj : PlayerInformationView?
    var playerImageViewModelObj: PlayerImageViewModel?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        playerImageViewModelObj = PlayerImageViewModel(obj:self)
        //let k = PlayersInfo?.playerImageUrl
       let k = playersInfo?.playerImageUrl
        
        playerImageViewModelObj?.fetchPlayerImage(imageUrl:k!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg4.jpg")!)
    }
     override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
        
        name.text = playersInfo?.playerName
        DOB.text = playersInfo?.playerDOB
        role.text = playersInfo?.playerRole
        battingStyle.text = playersInfo?.playerBattingStyle
        BowlingStyle.text = playersInfo?.playerBowlingStyle
        
        
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchParticularImage(image: UIImage){
        imageView.image = image
        
    }

}
