//
//  ViewController.swift
//  TableExample
//
//  Created by Mike Z on 10/1/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    let sectionsArray = ["Baseball", "Hockey", "Tennis"]
    
    var baseballScoresArray = ["1 to 2", "4 to 10"]
    let hockeyScoresArray = ["4 to 10", "1 to 2", "4 to 10"]
    let tennisScoresArray = ["1 to 2", "4 to 10","4 to 10","4 to 10","4 to 10"]
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        baseballScoresArray.append("4.3 to 3")
    }
    
    // MARK: - Code For view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData() // Reload the table view which will retrigger the functions below and check for new data
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArray[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionsArray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return baseballScoresArray.count
        case 1:
            return hockeyScoresArray.count
        case 2:
            return tennisScoresArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "BaseballCell")!
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "HockeyCell")!
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "TennisCell")!
        default:
           cell = tableView.dequeueReusableCell(withIdentifier: "BaseballCell")!
        }
        
        cell.textLabel?.text = "\(tennisScoresArray[indexPath.row]) score"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0 // height of our cell
    }
}

