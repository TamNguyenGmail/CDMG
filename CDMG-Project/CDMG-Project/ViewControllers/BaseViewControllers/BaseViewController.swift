//
//  BaseViewController.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit

class BaseViewController: UIViewController {
    //MARK: Properties

    //MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    
    //MARK: Helpers
    func setupUI() {
        
        view.backgroundColor = .white
        
        
        
    }

}
