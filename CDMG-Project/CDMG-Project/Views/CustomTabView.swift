//
//  CustomTabView.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit

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
    
    
    
    
}
