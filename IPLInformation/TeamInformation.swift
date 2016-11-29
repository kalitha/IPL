//
//  TeamInformation.swift
//  IPLInformation
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class TeamInformation: UITableViewController {

    var teamsViewModelObj : TeamsViewModel?//declaring a variable to hold TeamsViewModel properties
    var playersListViewModelObj : PlayersListViewModel?
    var teamName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        teamsViewModelObj = TeamsViewModel(obj:self)//assigning the contents of TeamsViewModel(i.e creating objeect of TeamsViewModel
        
        //single background image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg4.jpg")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    func reload(){
       
        self.tableView.reloadData()//it reloads the tablview so that numberOfRowsInSection and cellForRowAt methods will be called
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int{
//        return 1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return (teamsViewModelObj?.fetchNumberOfRows())!
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      let teamName = teamsViewModelObj?.contentAtEachRow(i: indexPath.row)
        cell.textLabel?.text = teamName
        let teamImage = teamsViewModelObj?.fetchEachImage(i: indexPath.row)
        
        cell.imageView?.image = teamImage
       
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear

        
        //animation
        
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                 cell.backgroundColor = UIColor.clear
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                
            }, completion: nil)
            
            index += 1
        }

        return cell
    }
    //navigating from 1 tabelviewcontroller to other
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
  self.teamName = (teamsViewModelObj?.contentAtEachRow(i: indexPath.row))!
       //print(teamName)
    
    performSegue(withIdentifier: "segueToPlayersList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // retrieve selected cell & fruit
           let playerListView = segue.destination as! PlayersListView
            playerListView.teamName = self.teamName
        
    }
    
}
