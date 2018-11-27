//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/13.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class HomeController: UITableViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationItems()
    }
    
    // MARK: - Basic Setups
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        setupCircularNavigationButton()
    }
    
    fileprivate func setupCircularNavigationButton() {
        let image = #imageLiteral(resourceName: "Peter").withRenderingMode(.alwaysOriginal)
        let customView = UIButton(type: .system)
        customView.setImage(image, for: .normal)
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        customView.imageView?.contentMode = .scaleAspectFit
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        customView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc func handleOpen() {
        let baseController = UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController
        baseController?.openMenu()
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

