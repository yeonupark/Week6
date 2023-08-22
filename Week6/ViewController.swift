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
// frame 한계 -> AutoresizingMask, AutoLayout (스토리보드), NSLayoutConstraints (코드베이스)
// NSLayoutConstraint
// 1. isActive
// 2. addConstraints

class ViewController: UIViewController {
    
    let emailTextField = UITextField() // 1.
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField) // 2.
        view.addSubview(passwordTextField)
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50) // 3.
        
        emailTextField.backgroundColor = .lightGray // 4.
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "이메일을 입력해주세요"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // nslayout 쓸 때 꼭 필요
        
        // 1. isActive
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true // 레이아웃 활성화
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100).isActive = true
        
        
        // 2. addConstraints
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
        
        view.addConstraints([leading, trailing, height, top])
        
        passwordTextField.backgroundColor = .systemCyan
        
        setLayoutAnchor()
        
    }
    
    @objc
    func signButtonClicked() {
        
        // 스토리보드 없는 뷰로 화면전환
        let vc = ExampleViewController1()
        present(vc,animated: true)
    }
    
    func setLayoutAnchor() {
        
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        view.addSubview(signButton)
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

