//
//  MainViewController.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Setup UI elements
    func setupUI(){
        self.view.backgroundColor = .white
        self.tabBarController?.navigationController?.navigationBar.backgroundColor = .clear
        self.tabBarController?.navigationController?.navigationBar.barTintColor = .clear

        self.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addAllViewsToTabBar()
    }
    
    /// connect all views to tab bar items
    func addAllViewsToTabBar(){
        let exploreVC1 = ExploreViewController()
        let home = UITabBarItem(title: "", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
        exploreVC1.tabBarItem = home

        let exploreVC2 = ExploreViewController()
        let search = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        exploreVC2.tabBarItem = search

        let exploreVC3 = ExploreViewController()
        let Compose = UITabBarItem(title: "", image: UIImage(systemName: "bolt.horizontal.icloud"), selectedImage: UIImage(systemName: "bolt.horizontal.icloud"))
        exploreVC3.tabBarItem = Compose

        let exploreVC4 = ExploreViewController()
        let Contacts = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        exploreVC4.tabBarItem = Contacts

        let exploreVC5 = ExploreViewController()
        let lightbulb = UITabBarItem(title: "", image: UIImage(systemName: "lightbulb"), selectedImage: UIImage(systemName: "lightbulb"))
        exploreVC5.tabBarItem = lightbulb

        let controllers = [exploreVC1, exploreVC2, exploreVC3, exploreVC4, exploreVC5]
        //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }

}
