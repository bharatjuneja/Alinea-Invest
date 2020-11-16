//
//  TrendingTableViewCell.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 13/11/20.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    var stock: Stock?{
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    func setupUI() {
        addImageView()
        addTitle()
        addSubtitle()
        addChangeLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addImageView() {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 15, width: 30, height: 30))
        imageView.image = UIImage(named: stock?.image ?? "Slack")
        self.contentView.addSubview(imageView)
    }
    func addTitle() {
        let title = UILabel(frame: CGRect(x: 65, y: 10, width: self.contentView.frame.size.width - 165, height: 15))
        title.text = stock?.name
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.contentView.addSubview(title)
    }
    func addSubtitle() {
        let subTitle = UILabel(frame: CGRect(x: 65, y: 30, width: self.contentView.frame.size.width - 165, height: 15))
        subTitle.text = stock?.code
        subTitle.textColor = .gray
        subTitle.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.contentView.addSubview(subTitle)
    }
    func addChangeLabel() {
        let change = UILabel(frame: CGRect(x: self.contentView.frame.size.width - 90, y: 20, width: 70, height: 20))
        change.text = (stock?.gainPercent ?? 0 > 0) ? "+\(stock?.gainPercent ?? 0)%" : "\(stock?.gainPercent ?? 0)%"
        change.textAlignment = .center
        change.layer.masksToBounds = true
        change.layer.cornerRadius = 10
        change.textColor = .white
        change.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        if stock?.gainPercent ?? 0 > 0 {
            change.backgroundColor = .green
        }else {
            change.backgroundColor = .systemPink
        }
        self.contentView.addSubview(change)
    }
}
