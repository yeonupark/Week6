//
//  SignUpViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let logoLabel = {
        let view = UILabel()
        view.text = "JACKFLIX"
        view.textColor = .red
        view.font = .boldSystemFont(ofSize: 30)
        view.textAlignment = .center
        
        return view
    }()
    
    let emailTextField = {
        let view = SignUpTextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    
    let passwordTextField = {
        let view = SignUpTextField()
        view.placeholder = "비밀번호"
        return view
    }()
    
    let nicknameTextField = {
        let view = SignUpTextField()
        view.placeholder = "닉네임"
        return view
    }()
    
    let locationTextField = {
        let view = SignUpTextField()
        view.placeholder = "위치"
        return view
    }()
    let codeTextField = {
        let view = SignUpTextField()
        view.placeholder = "추천 코드 입력"
        return view
    }()
    let signUpButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 16)
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let moreInfoLabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        view.font = .systemFont(ofSize: 16)
        
        return view
    }()
    
    let switchControl = {
        let view = UISwitch()
        view.onTintColor = .systemRed
        view.isOn = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(logoLabel)
        for item in [emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField, signUpButton] {
            view.addSubview(item)
        }
        view.addSubview(moreInfoLabel)
        view.addSubview(switchControl)
        
        setConstraints()
        
    }
    
    func setConstraints() {
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(80)
            make.height.equalTo(100)
        }
        
        let list = [emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField, signUpButton]
        
        for i in 0...list.count-1 {
            list[i].snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(40)
                make.top.equalToSuperview().inset(240 + i * 60)
                
                let length = i == list.count-1 ? 50 : 40
                make.height.equalTo(length)
            }
        }
        
        moreInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(40)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        switchControl.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(40)
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
    }

}
