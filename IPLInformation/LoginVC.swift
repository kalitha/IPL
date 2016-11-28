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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg4.jpg")!)

        // Do any additional setup after loading the view.
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
