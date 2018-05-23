//
//  ViewController.swift
//  CustomSearchBar
//
//  Created by sujustin on 2018/4/2.
//  Copyright © 2018年 SuJustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var str = [String]()
    var fullSize = UIScreen.main.bounds.size
    var searchStr: [String] = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var tableView: UITableView!
    var searchController: UISearchController!
    var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        
        
        //Add Table
        tableView = UITableView(frame: CGRect(
            x: 0, y: UIApplication.shared.statusBarFrame.origin.y,
            width: fullSize.width,
            height: fullSize.height),
                                     style: .plain)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(self.tableView)
        //Search
        searchController = UISearchController(searchResultsController: nil)
        searchBar = searchController.searchBar
        searchController.searchResultsUpdater = self
        //隱藏 NavigationBar
        searchController.hidesBottomBarWhenPushed = true
        searchController.hidesNavigationBarDuringPresentation = true
        //搜尋時 畫面變暗
        searchController.dimsBackgroundDuringPresentation = true
        //Bar Style
        searchBar.barStyle = .black
        searchBar.searchBarStyle = .minimal
        
        tableView.tableHeaderView = searchBar
    }
    
    func setData() {
        for var i in 1...50  {
            guard i > 9 else{
                str.append("0\(i)")
                continue
            }
            str.append("\(i)")
        }
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        searchStr = str.filter { $0.contains(searchBar.text!) }
        print("\(searchController.isActive)")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !searchController.isActive else {
            return searchStr.count
        }
        return str.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard !searchController.isActive else {
            cell.textLabel?.text = searchStr[indexPath.row]
            return cell
        }
        cell.textLabel?.text = str[indexPath.row]
        
        return cell
    }
}
