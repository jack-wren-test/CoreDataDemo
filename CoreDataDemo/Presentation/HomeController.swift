//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Jack Smith on 17/02/2020.
//  Copyright © 2020 Jack Smith. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    // MARK:- Properties
    
    private var humans: [Human] = []
    
    // MARK:- Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadHumans()
    }
    
    // MARK:- Private

    private func loadHumans() {
        if let humans = CoreDateClient.shared.loadHumans() {
            self.humans = humans
            self.tableView.reloadData()
        }
    }
}

extension HomeController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return humans.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HumanCell") as! HumanCell
        cell.human = self.humans[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

