//
//  LoginVCViewController.swift
//  IPLInformation
//
//  Created by BridgeLabz Solutions LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailId: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //code for single background image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "violet.jpg")?.draw(in: self.view.bounds)
        
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.emailId.transform = CGAffineTransform(translationX:300, y: 0)
        self.password.transform = CGAffineTransform(translationX:300, y: 0)
        UIView.animate(withDuration: 0.5, animations: {
            self.emailId.transform = CGAffineTransform(translationX: 0, y: 0)
            self.password.transform = CGAffineTransform(translationX:0, y:0)
        }, completion: nil)

        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        self.emailId.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        FIRAuth.auth()?.signIn(withEmail: emailId.text!, password: password.text!) { (user, error) in
            if((error) != nil){
                let alert = UIAlertController(title: "Alert", message: "user doesn't exit", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                self.performSegue(withIdentifier: "navigatingToTeams", sender: nil)
                
            }
        }

        
    }
    
    @IBAction func signUp(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: emailId.text!, password: password.text!) { (user, error) in
            if((error) != nil){
                let alert = UIAlertController(title: "Alert", message: "please provide valid details", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                self.performSegue(withIdentifier: "navigatingToTeams", sender: nil)

            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
