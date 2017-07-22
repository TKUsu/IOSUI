//
//  ViewController.swift
//  IOSCustomTable
//
//  Created by sujustin on 2017/5/2.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var dialogue = [Messages]()
    var tableIndex: Int!
    var count = 1
    
    var name = ["peter","justin"]
    var messages = ["hello","hey"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        //test data
        for i in 0 ..< name.count {
            dialogue.append(Messages(userName: name[i], messages: messages[i], messagesTime: "\(hour):\(minutes)"))
        }
        
        /*====================  TableView Init  ====================
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
        //====================  TableView Setting  ====================
            //Separator Line Style
            tableView.separatorStyle = .none
        /*
            //Separator distance (Top, Left, Bottom, Right)
            tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
            //Selectable cell
            tableView.allowsSelection = true
            //Selectable multiple cell
            tableView.allowsMultipleSelection = false
            //Add View
            view.addSubview(tableView)
         */
        
        //Transform Table
        self.tableView.transform = CGAffineTransform (scaleX: 1,y: -1);

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    //cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dialogue.count
    }
    //cell init & data assign
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        tableIndex = dialogue.count - count
        cell.textLabel?.text = dialogue[tableIndex!].messages
        count += 1
        cell.contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
        if dialogue[tableIndex!].userName == "peter"{
            cell.textLabel?.textAlignment = .right
        }
        
        return cell
        /*====================  Accessory Button Style  ====================
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
        */
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Detail", message: "User: \(dialogue[tableIndex].userName) \nTime: \(dialogue[tableIndex].messagesTime)", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*====================  Accessory Button Style  ====================
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
}
