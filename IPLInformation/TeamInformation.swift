//
//  TeamInformation.swift
//  IPLInformation
//
//  Created by BridgeLabz Solutions LLP on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class TeamInformation: UITableViewController {

    var teamsViewModelObj : TeamsViewModel?//creating the object of TeamsViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
      return cell
    }
    

}
