//
//  CustomTabView.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit
import SnapKit

class CustomTabView: UIView {
    //MARK: Properties
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    private var imageArray = [UIImageView]()
    var labelArray = [UILabel]()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
                
        for index in 0..<menuItems.count {
            
            let itemWidth = frame.width / CGFloat(menuItems.count)
            let offsetX = itemWidth * CGFloat(index)
            let menuItem = menuItems[index]
            
            let (itemView, label) = createTabItem(item: menuItem, atIndex: index)
            itemView.clipsToBounds = true
            itemView.tag = index
            self.labelArray.append(label)
            
            addSubview(itemView)
            itemView.snp.makeConstraints{ make in
                
                make.width.equalTo(itemWidth)
                make.height.equalToSuperview()
                make.leading.equalToSuperview().offset(offsetX)
                make.top.equalToSuperview()
                
            }
            
        }
        
        setNeedsLayout()
        layoutIfNeeded()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
                
    }
    
    //MARK: Actions
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        guard let toTag = sender.view?.tag else {return}
                
    }
    
    //MARK: Helpers
    func createTabItem(item: TabItem, atIndex: Int) -> (containerView: UIView, label: UILabel) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        let tabBarItem = UIView()
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.clipsToBounds = true
        tabBarItem.addGestureRecognizer(tap)
        
        let itemTitleLabel = UILabel()
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        itemTitleLabel.textColor = .darkText
        itemTitleLabel.numberOfLines = 0

        let itemImageView = UIImageView()
        itemImageView.clipsToBounds = true
        itemImageView.contentMode = .scaleAspectFit
        self.imageArray.append(itemImageView)
        
        if atIndex == 2 {
            
            itemImageView.image = item.icon?.withTintColor(.white, renderingMode: .automatic)
            
            let circleView = UIView()
            circleView.backgroundColor = Colors.color_E6005ba1
            circleView.layer.cornerRadius = 40 / 2
            circleView.layer.borderWidth = 5
            circleView.layer.borderColor = Colors.color_A1CEFB.cgColor
            
            tabBarItem.addSubview(itemTitleLabel)
            tabBarItem.addSubview(circleView)
            
            circleView.snp.makeConstraints{ make in
                
                make.height.width.equalTo(40)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
                
            }
            
            circleView.addSubview(itemImageView)
            itemImageView.snp.makeConstraints{ make in
                
                make.center.equalToSuperview()
                make.width.height.equalTo(18)
                
            }
            
            itemTitleLabel.snp.makeConstraints{ make in
                
                make.top.equalTo(itemImageView.snp.bottom).offset(4)
                make.leading.trailing.equalToSuperview()
                make.bottom.greaterThanOrEqualToSuperview().inset(8)
                
            }
            
            
        } else {
            
            itemImageView.image = item.icon?.withRenderingMode(.automatic)
            
            tabBarItem.addSubview(itemTitleLabel)
            tabBarItem.addSubview(itemImageView)
            
            itemImageView.snp.makeConstraints{ make in
                
                make.height.width.equalTo(20)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(4)
                
            }
            
            itemTitleLabel.snp.makeConstraints{ make in
                
                make.top.equalTo(itemImageView.snp.bottom).offset(4)
                make.leading.trailing.equalToSuperview()
                make.bottom.greaterThanOrEqualToSuperview().inset(8)
                
            }
            
        }
        
        return (tabBarItem, itemTitleLabel)
        
    }
    
    func translateNameForTabItemLabel(items: [TabItem]) {
        
        for index in 0..<items.count {
            
            self.labelArray[index].text = items[index].displayTitle
            
        }
        
    }
    
    
    
    
}
