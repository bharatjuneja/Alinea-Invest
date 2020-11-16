//
//  TrendingViewController.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import UIKit

class TrendingViewController: UIViewController {
    var trendingTable: UITableView?
    var viewModel = TrendingViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addTable() {
        trendingTable = UITableView.init(frame: self.view.frame)
        self.view.addSubview(trendingTable ?? UIView())
//        trendingTable?.register(UINib(nibName: "TrendingTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingTableViewCell")
        trendingTable?.register(TrendingTableViewCell.self as AnyClass, forCellReuseIdentifier: "TrendingTableViewCell")
      trendingTable?.delegate = self
        trendingTable?.dataSource = self
    }
}
extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.topGainers.count
        }else {
            return viewModel.topSellers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TrendingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
            
        if indexPath.section == 0 {
            cell.stock = viewModel.topGainers[indexPath.row]
        }
        else {
            cell.stock = viewModel.topSellers[indexPath.row]
        }
        return cell

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_: UITableView, heightForHeaderInSection: Int) -> CGFloat {
        return 50
    }
    func tableView(_: UITableView, viewForHeaderInSection: Int) -> UIView?
    {
        let header = UIView(frame: CGRect(x:0,y:0, width: self.view.frame.size.width, height: 50))
        let title = UILabel(frame: CGRect(x:20,y:20, width: self.view.frame.size.width, height: 20))
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        if viewForHeaderInSection == 0 {
            title.text = "Top Gainers"
        }else {
            title.text = "Top Sellers"
        }
        header.addSubview(title)
        header.backgroundColor = .white
        return header
    }
}
