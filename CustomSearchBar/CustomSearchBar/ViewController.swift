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
    var searchStr: [String] = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var tableView: UITableView!
    var searchController: UISearchController!
    var searchBar: UISearchBar{
        return searchController.searchBar
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        str = getTestData()
        tableView = setupTableView()
        view.addSubview(self.tableView)
        
        searchController = setupSearchController()
        setupSearchBar()
        tableView.tableHeaderView = searchBar
    }
    
    fileprivate func getTestData() -> [String] {
        var data: [String] = []
        for i in 1...50  {
            guard i > 9 else{
                data.append("0\(i)")
                continue
            }
            data.append("\(i)")
        }
        return data
    }
    
    fileprivate func setupTableView() -> UITableView {
        let fullSize = UIScreen.main.bounds.size
        let tableView = UITableView(frame: CGRect(
            x: 0, y: UIApplication.shared.statusBarFrame.origin.y,
            width: fullSize.width,
            height: fullSize.height),
                                style: .plain)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
    
    fileprivate func setupSearchController() -> UISearchController{
        //Search
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        //隱藏 NavigationBar
        searchController.hidesBottomBarWhenPushed = true
        searchController.hidesNavigationBarDuringPresentation = true
        //搜尋時 畫面變暗
        searchController.dimsBackgroundDuringPresentation = true
        
        return searchController
    }
    
    fileprivate func setupSearchBar() {
        //Bar Style
        searchBar.barStyle = .black
        searchBar.searchBarStyle = .minimal
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        searchStr = str.filter { $0.contains(searchBar.text!) }
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
