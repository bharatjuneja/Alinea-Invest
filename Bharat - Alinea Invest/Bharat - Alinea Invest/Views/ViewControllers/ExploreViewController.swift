//
//  ExploreViewController.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import UIKit

enum SelectedSubTab {
    case Category
    case Themes
    case Trending
}
class ExploreViewController: UIViewController {
    var currentSubTab: SelectedSubTab = .Category {
        didSet {
            refreshScreen()
        }
    }
    let categoryVC = CategoryViewController()
    let themesVC = ThemesViewController()
    let trendingVC = TrendingViewController()
    var categoryBtn: CustomButton?
    var themesBtn: CustomButton?
    var trendingBtn: CustomButton?
    var containerView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        addStackView()
        addContainerView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        refreshScreen()
    }
    func setupNavBar(){
        self.view.backgroundColor = .white
        self.tabBarController?.navigationController?.navigationBar.backgroundColor = .clear
        self.tabBarController?.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.title = "Explore"
        let sideMenu = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.leftBarButtonItem  = sideMenu
        self.tabBarController?.navigationItem.leftBarButtonItem?.tintColor = .black
        
        let more = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.rightBarButtonItem  = more
        self.tabBarController?.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    func addContainerView() {
        containerView = UIView(frame: CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height - 250))
        self.view.addSubview(containerView!)
    }
    func addStackView(){
        let stackView = CustomStackView(frame: CGRect(x: 20, y: 80, width: self.view.frame.size.width - 40 , height: 30))
        // category
        categoryBtn = CustomButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        categoryBtn?.setTitle("Category", for: .normal)
        categoryBtn?.style = .subtitleBtn
        categoryBtn?.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        
        let verticalLine1 = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 50))
        verticalLine1.backgroundColor = .lightGray
        verticalLine1.addWidthConstraint(width: 1)
        // themes
        themesBtn = CustomButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        themesBtn?.style = .subtitleBtn
        themesBtn?.setTitle("Themes", for: .normal)
        themesBtn?.addTarget(self, action: #selector(themesTapped), for: .touchUpInside)

        let verticalLine2 = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 50))
        verticalLine2.backgroundColor = .lightGray
        verticalLine2.addWidthConstraint(width: 1)

        // trending
        trendingBtn = CustomButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        trendingBtn?.style = .subtitleBtn
        trendingBtn?.setTitle("Trending", for: .normal)
        trendingBtn?.addTarget(self, action: #selector(trendingTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(categoryBtn ?? UIView())
        stackView.addArrangedSubview(verticalLine1)
        stackView.addArrangedSubview(themesBtn ?? UIView())
        stackView.addArrangedSubview(verticalLine2)
        stackView.addArrangedSubview(trendingBtn ?? UIView())
        
        self.view.addSubview(stackView)
    }
    @objc func categoryTapped() { self.currentSubTab = .Category }
    @objc func themesTapped() { self.currentSubTab = .Themes }
    @objc func trendingTapped() { self.currentSubTab = .Trending }

    func refreshScreen() {
        categoryVC.view.removeFromSuperview()
        themesVC.view.removeFromSuperview()
        trendingVC.view.removeFromSuperview()
        categoryBtn?.isSelected = false
        themesBtn?.isSelected = false
        trendingBtn?.isSelected = false
        if currentSubTab == .Category {
            containerView?.addSubview(categoryVC.view)
            categoryBtn?.isSelected = true
        }
        else if currentSubTab == .Themes {
            containerView?.addSubview(themesVC.view)
            themesBtn?.isSelected = true
        }
        else if currentSubTab == .Trending {
            containerView?.addSubview(trendingVC.view)
            trendingVC.addTable()
            trendingBtn?.isSelected = true
        }
    }
}
