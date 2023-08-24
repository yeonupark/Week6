//
//  SignUpTextField.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit

class SignUpTextField: UITextField {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        textColor = .black
        textAlignment = .center
        font = .systemFont(ofSize: 15)
        
    }
}
