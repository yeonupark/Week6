//
//  ViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/21.
//

import UIKit

// 1. 뷰객체 프로퍼티 선언 (클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 (아울렛 연결과 유사한 단계)
// 3. 레이아웃 (크기 + 위치 조정)
// 4. 속성 정의

class ViewController: UIViewController {
    
    let emailTextField = UITextField() // 1.
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField) // 2.
        view.addSubview(passwordTextField)
        
        
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50) // 3.
        
        emailTextField.backgroundColor = .lightGray // 4.
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "이메일을 입력해주세요"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true // 레이아웃 활성화
        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100).isActive = true
        
        passwordTextField.backgroundColor = .systemCyan
        
    }


}

