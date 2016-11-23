//
//  TeamInformation.swift
//  IPLInformation
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class TeamInformation: UITableViewController {

    var teamsViewModelObj : TeamsViewModel?//creating the object of TeamsViewModel
    var playersListViewModelObj : PlayersListViewModel?
    var teamName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg4.jpg")!)
        //self.tableView.backgroundColor = UIColor.clear
        
        teamsViewModelObj = TeamsViewModel(obj:self)//assigning the contents of TeamsViewModel
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
       
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor.black
        
        cell.backgroundColor = UIColor.clear
        cell.imageView?.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.imageView?.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.imageView?.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
        
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
