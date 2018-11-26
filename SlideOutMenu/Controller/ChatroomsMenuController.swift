//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/26.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ChatroomsMenuController: UITableViewController {
    
    let chatRoomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["David", "Abby", "Jing Han", "映如"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(displayP3Red: 78/255, green: 56/255, blue: 73/255, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatRoomGroups.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "UNREADS"
        case 1:
            return "CHANNELS"
        default:
            return "DIRECT MESSAGES"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatRoomGroups[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = chatRoomGroups[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
 




}
