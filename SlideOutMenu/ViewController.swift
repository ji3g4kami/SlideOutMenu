//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/13.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationItems()
    }
    
    @objc func handleOpen() {
        print("Open")
        
        let vc = MenuController()
        
        vc.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.8, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(vc.view)
    }
    
    @objc func handleHide() {
        print("Hide")
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

}

