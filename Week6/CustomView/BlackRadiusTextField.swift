//
//  BlackRadiusTextField.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    // 초기화구문 생성 (codebase)
    // Interface Builder를 사용하지 않고, UIView를 상속받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { // UIView 클래스에서 온 애
        
        super.init(frame: frame)
        setupView()
    }
    
    // NSCoding
    // XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    // Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문
    required init?(coder: NSCoder) { // NSCoding 프로토콜에서 온 애
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
        
    }
    
}

// 초기화 구문 강제하는 프로토콜
protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    required init(name: String) { // 프로토콜에서 생성한 초기화구문이구나! override는 슈퍼클래스에서 왔을 때 사용하는거.
        
    }
    
    
}
