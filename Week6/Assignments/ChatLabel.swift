//
//  ChatLabel.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit

class ChatLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        layer.cornerRadius = 8
        backgroundColor = .white
        textColor = .black
        clipsToBounds = true //
    }
}
