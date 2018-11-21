//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/13.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

let screenBounds = UIScreen.main.bounds
let menuWidth = UIScreen.main.bounds.width * 0.8
let velocityOpenThreshold: CGFloat = 500

class HomeController: UITableViewController {
    
    let menuController = MenuController()
    fileprivate var isMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationItems()
        setupMenuController()
        
        // Pan gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            var x = translation.x
            if isMenuOpen {
                x += menuWidth
            }
            x = min(menuWidth, x)
            x = max(x, 0)
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuController.view.transform = transform
            navigationController?.view.transform = transform
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        if isMenuOpen {
            if abs(velocity.x) > velocityOpenThreshold {
                handleHide()
                return
            }
            if abs(translation.x) < menuWidth/4 {
                handleOpen()
            } else {
                handleHide()
            }
        } else {
            if velocity.x > velocityOpenThreshold {
                handleOpen()
                return
            }
            if translation.x < menuWidth/4 {
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
    @objc func handleOpen() {
        isMenuOpen = true
        performAnimations(transform: CGAffineTransform(translationX: menuWidth, y: 0))
    }
    
    @objc func handleHide() {
        isMenuOpen = false
        performAnimations(transform: .identity)
    }
    
    fileprivate func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [unowned self] in
            self.menuController.view.transform = transform
            self.navigationController?.view.transform = transform
        })
    }
    
    // MARK: - Basic Setups
    
    fileprivate func setupMenuController() {
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: screenBounds.height)
        addChild(menuController)
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

