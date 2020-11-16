//
//  ThemesViewController.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import UIKit

class ThemesViewController: UIViewController {
    private var viewModel: ThemesViewModel?
    var themesCollectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCollectionView()
        viewModel = ThemesViewModel()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        themesCollectionView = nil
    }
    func addCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 40, right: 40)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2 - 80, height: self.view.frame.size.width/2 - 80)
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 40
        themesCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.height - 140), collectionViewLayout: layout)
        themesCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        themesCollectionView?.backgroundColor = UIColor.white
        themesCollectionView?.delegate = self
        themesCollectionView?.dataSource = self
        self.view.addSubview(themesCollectionView ?? UIView())
    }
}
extension ThemesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var themeCell = UICollectionViewCell()
        themeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let theme = viewModel?.themeList[indexPath.row]

        let image = UIImageView(frame: CGRect(x: 30, y: 20, width: themeCell.contentView.frame.size.width-60, height: themeCell.contentView.frame.size.height - 70))
        image.image = UIImage(systemName: theme?.displayImage ?? "")
        image.tintColor = .black
        let titleLabel = UILabel(frame: CGRect(x: 5, y: themeCell.contentView.frame.size.height - 40, width: themeCell.contentView.frame.size.width - 10, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        titleLabel.numberOfLines = 0
        titleLabel.text = theme?.title
        titleLabel.addWidthConstraint(width: themeCell.frame.size.width - 10)
        themeCell.contentView.addSubview(image)
        themeCell.contentView.addSubview(titleLabel)
        themeCell.backgroundColor = UIColor.init(white: 0.1, alpha: 0.1)
        themeCell.layer.cornerRadius = 10
        return themeCell
    }
    
    
}
