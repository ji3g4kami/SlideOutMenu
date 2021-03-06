//
//  BaseSlidingController.swift
//  SlideOutMenu
//
//  Created by udn on 2018/11/21.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class CenterView: UIView {}
class LeftMenuView: UIView {}
class DarkCoverView: UIView {}

class BaseSlidingController: UIViewController {
    
    fileprivate var isMenuOpened = false
    fileprivate var centerViewController: UIViewController = UINavigationController(rootViewController: HomeController()) {
        didSet {
            oldValue.view.removeFromSuperview()
            oldValue.removeFromParent()
        }
    }
    var redViewLeadingConstraint: NSLayoutConstraint!
    var redViewTrailingConstraint: NSLayoutConstraint!
    
    let redView: CenterView = {
        let view = CenterView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blueView: LeftMenuView = {
        let view = LeftMenuView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let darkCoverView: DarkCoverView = {
        let view = DarkCoverView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        setupViews()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        darkCoverView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapDismiss() {
        closeMenu()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpened ? x + menuWidth : x
        
        x = min(menuWidth, x)
        x = max(0, x)
        redViewLeadingConstraint.constant = x
        redViewTrailingConstraint.constant = x
        darkCoverView.alpha = x/menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpened {
            if abs(velocity.x) > velocityOpenThreshold {
                closeMenu()
                return
            }
            if abs(translation.x) < menuWidth/2 {
                openMenu()
            } else {
                closeMenu()
            }
        } else {
            if abs(velocity.x) > velocityOpenThreshold {
                openMenu()
                return
            }
            if abs(translation.x) < menuWidth/2 {
                closeMenu()
            } else {
                openMenu()
            }
        }
        
    }
    
    func openMenu() {
        isMenuOpened = true
        redViewLeadingConstraint.constant = menuWidth
        redViewTrailingConstraint.constant = menuWidth
        performAnimations()
    }

    func closeMenu() {
        isMenuOpened = false
        redViewLeadingConstraint.constant = 0
        redViewTrailingConstraint.constant = 0
        performAnimations()
    }
    
    func didSelectMenuItem(indexPath: IndexPath) {
        closeMenu()
        
        switch indexPath.row {
        case 0:
            changeCenterController(to: UINavigationController(rootViewController: HomeController()))
        case 1:
            changeCenterController(to: UINavigationController(rootViewController: ListsController()))
        case 2:
            changeCenterController(to: BookmarksController())
        default:
            let tabBarController = UITabBarController()
            let momentsController = UIViewController()
            momentsController.navigationItem.title = "Moments"
            momentsController.view.backgroundColor = .orange
            let navController = UINavigationController(rootViewController: momentsController)
            navController.tabBarItem.title = "Moments"
            tabBarController.viewControllers = [navController]
            changeCenterController(to: tabBarController)
        }
        
        redView.bringSubviewToFront(darkCoverView)
    }
    
    fileprivate func changeCenterController(to viewController: UIViewController) {
        redView.addSubview(viewController.view)
        addChild(viewController)
        centerViewController = viewController
    }
    
    fileprivate func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
        }, completion: nil)
    }
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true
        
        redViewTrailingConstraint = redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        redViewTrailingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        let menuController = MenuController()
        
        let homeView = centerViewController.view!
        let menuView = menuController.view!
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(homeView)
        redView.addSubview(darkCoverView)
        blueView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            darkCoverView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: redView.trailingAnchor)
        ])
        
        addChild(centerViewController)
        addChild(menuController)
    }

}
