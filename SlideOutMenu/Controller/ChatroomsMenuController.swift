//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/26.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

let menuBackgroundColor = UIColor(displayP3Red: 78/255, green: 56/255, blue: 73/255, alpha: 1)
let headerLabelColor = UIColor(displayP3Red: 0.4745, green: 0.4078, blue: 0.4667, alpha: 1)

class ChatroomsMenuController: UITableViewController {
    
    let chatRoomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["David", "Abby", "Jing Han", "映如"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = menuBackgroundColor
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatRoomGroups.count
    }
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatroomHeaderLabel()
        switch section {
        case 0:
            label.text = "UNREADS"
        case 1:
            label.text = "CHANNELS"
        default:
            label.text = "DIRECT MESSAGES"
        }
        label.backgroundColor = menuBackgroundColor
        label.textColor = headerLabelColor
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatRoomGroups[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        let text = chatRoomGroups[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [
            .foregroundColor: headerLabelColor,
            .font: UIFont.systemFont(ofSize: 18, weight: .regular)
            ])
        attributedText.append(NSMutableAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        return cell
    }
 




}
