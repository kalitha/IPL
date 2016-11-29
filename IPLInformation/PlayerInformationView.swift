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
        
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backgroundView: UIView!
    var playersInfo: Players?//storing single model
  
    var playerImageViewModelObj: PlayerImageViewModel?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        playerImageViewModelObj = PlayerImageViewModel(obj:self)
        //let k = PlayersInfo?.playerImageUrl
       let k = playersInfo?.playerImageUrl
        
        playerImageViewModelObj?.fetchPlayerImage(imageUrl:k!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg4.jpg")!)
        
        //single background image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg4.jpg")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        self.backgroundView.backgroundColor = UIColor(patternImage: backgroundImage)
        
        }
    
     override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
        
        
        name.text = playersInfo?.playerName
        DOB.text = playersInfo?.playerDOB
        role.text = playersInfo?.playerRole
        battingStyle.text = playersInfo?.playerBattingStyle
        BowlingStyle.text = playersInfo?.playerBowlingStyle
        nationality.text = playersInfo?.playerNationality
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchParticularImage(image: UIImage){
        imageView.image = image
        activityIndicator.stopAnimating()
        imageView.alpha = 0
        
        //animation
        imageView.transform = CGAffineTransform(translationX: -50, y: -50)
        UIView.animate(withDuration: 1, animations: {
            self.imageView.transform = CGAffineTransform(translationX: 100, y: 100)
            self.imageView.alpha = 1
        }, completion: {finished in
            UIView.animate(withDuration: 1, animations: {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
        })

        
    }

}
