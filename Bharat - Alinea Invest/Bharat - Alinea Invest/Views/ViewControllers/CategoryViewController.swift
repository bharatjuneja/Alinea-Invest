//
//  CategoryViewController.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        // Do any additional setup after loading the view.
    }
    func addButtons() {
        let categoryStack = UIStackView(frame: CGRect(x: 20, y: 0, width: self.view.frame.size.width-40, height: 280))
        let seperator1 = UIView(frame: CGRect(x: 0, y: 5, width: self.view.frame.size.width, height: 2))
        seperator1.backgroundColor = .darkGray
        categoryStack.axis = .vertical
        categoryStack.distribution = .fillEqually
        categoryStack.alignment = .fill
        categoryStack.spacing = 20

        categoryStack.addArrangedSubview(getStacks(image: UIImage(systemName: "list.bullet.rectangle") ?? UIImage(), text: "Stocks", color: .purple))
        categoryStack.addArrangedSubview(getStacks(image: UIImage(systemName: "xmark.bin.circle") ?? UIImage(), text: "ETFs", color: .blue))
        categoryStack.addArrangedSubview(getStacks(image: UIImage(systemName: "bitcoinsign.circle") ?? UIImage(), text: "Crypto", color: .orange))
        self.view.addSubview(categoryStack)
    }
    func getStacks(image: UIImage, text: String, color: UIColor)-> UIStackView {
        let stack = UIStackView(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40 , height: 80))
        
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 30
        let space1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 80))
        space1.addWidthConstraint(width: 5)
        let imageCover = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 80))
        imageCover.backgroundColor = .clear
        let stackImage = UIImageView(frame: CGRect(x: 0, y: 30, width: 20, height: 20))
        stackImage.image = image
        stackImage.addWidthConstraint(width: 20)
        stackImage.addHeightConstraint(height: 20)
        stackImage.tintColor = .white
        imageCover.addSubview(stackImage)
        let stackLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        stackLabel.text = text
        stackLabel.textColor = .white
        stackLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        stackLabel.addHeightConstraint(height: 80)
        stack.addArrangedSubview(space1)
        stack.addArrangedSubview(imageCover)
        stack.addArrangedSubview(stackLabel)
        stack.backgroundColor = color
        stack.layer.cornerRadius = 40
        stack.layer.masksToBounds = true
        return stack
    }
}
