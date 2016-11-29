//
//  PlayersListTableViewController.swift
//  IPLInformation
//
//  Created by Kalitha H N on 21/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class PlayersListView: UITableViewController {
    
    var playersListViewModelObj: PlayersListViewModel?
    var teamName: String?
    var playerInfo : Players?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg4.jpg")!)
        playersListViewModelObj = PlayersListViewModel(obj: self)
        playersListViewModelObj?.callingControllerfetchData(teamName: teamName!)
        
        
        self.navigationItem.title = teamName
        
        //single image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg4.jpg")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
    }


    func reload(){
        self.tableView.reloadData()//it reloads the tablview so that numberOfRowsInSection and cellForRowAt methods will be called
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (playersListViewModelObj?.fetchNumberOfRows())!
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerInfo", for: indexPath)
        
        let playerName = playersListViewModelObj?.contentAtEachRow(i: indexPath.row)
        cell.textLabel?.text = playerName
        //cell.backgroundColor = UIColor.purple
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor.black
        
         cell.backgroundColor = UIColor.clear
        
       
                return cell
        
    }
    //delegate method for printing the selected row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        self.playerInfo = playersListViewModelObj?.fetchModel(i: indexPath.row)
        //print(playerInfo)
        performSegue(withIdentifier: "segueToPlayerDetails", sender: nil)
        
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playerInformationView = segue.destination as! PlayerInformationView
        
        playerInformationView.playersInfo = self.playerInfo
        
    }
    

}
