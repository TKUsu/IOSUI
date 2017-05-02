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
        
        /*  TableView Init
            //Get Screen Size
            let fullScreenSize = UIScreen.main.bounds.size
            //Create UITable
            let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height), style: .grouped)
            //Register Table Cell, name = "Cell"
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            //Delegete Init
        */
        tableView.delegate = self
        tableView.dataSource = self
        /*  TableView Setting
            //Separator Line Style
            tableView.separatorStyle = .singleLine
            //Separator distance (Top, Left, Bottom, Right)
            tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
            //Selectable cell
            tableView.allowsSelection = true
            //Selectable multiple cell
            tableView.allowsMultipleSelection = false
            //Add View
            view.addSubview(tableView)
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    //cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room.count
    }
    //cell init & data assign
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = room[indexPath.row]
        
        /*  Accessory Button Style
            if indexPath.section == 1 {
                if indexPath.row == 0 {
                    cell.accessoryType = .checkmark
                } else if indexPath.row == 1 {
                    cell.accessoryType = .detailButton
                } else if indexPath.row == 2 {
                    cell.accessoryType =
                        .detailDisclosureButton
                } else if indexPath.row == 3 {
                    cell.accessoryType = .disclosureIndicator
                }
            }
            // 點選 cell 後執行的動作
            func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
                // 取消 cell 的選取狀態
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
         
                let name = info[indexPath.section][indexPath.row]
                print("選擇的是 \(name)")
            }
         
            // 點選 Accessory 按鈕後執行的動作
            // 必須設置 cell 的 accessoryType
            // 設置為 .DisclosureIndicator (向右箭頭)之外都會觸發
            func tableView(tableView: UITableView,accessoryButtonTappedForRowWithIndexPathindexPath: NSIndexPath) {
                let name = info[indexPath.section][indexPath.row]
                print("按下的是 \(name) 的 detail")
            }
         
            // 有幾組 section
            func numberOfSectionsInTableView(tableView: UITableView) -> Int {
                return info.count
            }
         
            // 每個 section 的標題
            func tableView(tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
                let title = section == 0 ? "籃球" : "棒球"
            return title
            }
         
            //Other section delegate
            // 設置每個 section 的 title 為一個 UIView
            // 如果實作了這個方法 會蓋過單純設置文字的 section title
            func tableView(tableView: UITableView,viewForHeaderInSection section: Int) -> UIView? {
                return UIView()
            }
         
            // 設置 section header 的高度
            func tableView(tableView: UITableView,heightForHeaderInSection section: Int) -> CGFloat {
                return 80
            }
         
            // 每個 section 的 footer
            func tableView(tableView: UITableView,titleForFooterInSection section: Int) -> String? {
                return "footer"
            }
         
            // 設置每個 section 的 footer 為一個 UIView
            // 如果實作了這個方法 會蓋過單純設置文字的 section footer
            func tableView(tableView: UITableView,viewForFooterInSection section: Int) -> UIView? {
                return UIView()
            }

            // 設置 section footer 的高度
            func tableView(tableView: UITableView,heightForFooterInSection section: Int) -> CGFloat {
                return 80
            }
         
            // 設置 cell 的高度
            func tableView(tableView: UITableView,heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
                return 80
            }
         */
 
        return cell
    }
}
