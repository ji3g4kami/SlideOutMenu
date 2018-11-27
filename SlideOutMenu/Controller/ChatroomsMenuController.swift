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
    
    var filteredResults = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredResults = chatRoomGroups
        
        tableView.backgroundColor = menuBackgroundColor
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredResults.count
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
        return filteredResults[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        let text = filteredResults[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.titleLabel.text = text
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [
            .foregroundColor: headerLabelColor,
            .font: UIFont.systemFont(ofSize: 18, weight: .regular)
            ])
        attributedText.append(NSMutableAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        cell.titleLabel.attributedText = attributedText
        return cell
    }
}


extension ChatroomsMenuController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var results = [[String]]()
        
        if searchText.isEmpty {
            filteredResults = chatRoomGroups
            tableView.reloadData()
            return
        }
        
        chatRoomGroups.forEach { (group) in
            let filteredGroup = group.filter { $0.lowercased().contains(searchText.lowercased()) }
            results.append(filteredGroup)
        }
        
        filteredResults = results
        tableView.reloadData()
    }
}
