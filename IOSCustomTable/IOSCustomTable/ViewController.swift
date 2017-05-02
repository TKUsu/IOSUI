//
//  ViewController.swift
//  IOSCustomTable
//
//  Created by sujustin on 2017/5/2.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var room = ["1","2","3","4"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            //Get Screen Size
            let fullScreenSize = UIScreen.main.bounds.size
            //Create UITable
            let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height), style: .grouped)
            //Register Table Cell, name = "Cell"
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            //
         */
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = room[indexPath.row]
        return cell
    }
}
