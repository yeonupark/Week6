//
//  ExampleViewController2.swift
//  Week6
//
//  Created by 마르 on 2023/08/23.
//

import UIKit
import SnapKit

class ExampleViewController2: UIViewController {

    let backgroundView = UIImageView()
    let bottomView = UIView()
    let profileImageView = UIImageView()
    let profileLabel = UILabel()
    let cancelButton = UIButton()
    let giftButton = UIButton()
    let qrButton = UIButton()
    let settingButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in [backgroundView,bottomView,profileImageView,profileLabel,cancelButton,settingButton,qrButton,giftButton] {
            view.addSubview(item)
        }
        
        setEditButton()
        setChatButton()
        setStoryButton()
        
        designView()
        setConstraints()
    }
    
    // 버튼 레이아웃 조절
    func setButtonLayout(title: String, imageName: String) -> UIButton.Configuration {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.image = UIImage(systemName: imageName)
        
        configuration.imagePlacement = .top
        configuration.imagePadding = 10

        return configuration
    }
    
    func setEditButton() {
        let editButton = UIButton(configuration: setButtonLayout(title: "프로필 편집", imageName: "pencil"), primaryAction: nil)
        editButton.tintColor = .white
        bottomView.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.5)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
        }
    }
    
    func setChatButton() {
        let chatButton = UIButton(configuration: setButtonLayout(title: "나와의 채팅", imageName: "message.fill"), primaryAction: nil)
        chatButton.tintColor = .white
        bottomView.addSubview(chatButton)
        chatButton.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview().inset(20)
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.5)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
        }
    }
    
    func setStoryButton() {
        let storyButton = UIButton(configuration: setButtonLayout(title: "카카오스토리", imageName: "quote.closing"), primaryAction: nil)
        storyButton.tintColor = .white
        bottomView.addSubview(storyButton)
        storyButton.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview().inset(20)
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.5)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
        }
    }
    
    func designView() {
        
        backgroundView.image = UIImage(named: "beach")
        bottomView.layer.borderWidth = 1
        bottomView.layer.borderColor = UIColor.white.cgColor
        
        profileImageView.image = UIImage(named: "flower")
        profileImageView.layer.cornerRadius = 20
        profileLabel.text = "Yeonu"
        profileLabel.font = .boldSystemFont(ofSize: 17)
        profileLabel.textColor = .white
        profileLabel.textAlignment = .center
        
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.tintColor = .white
        giftButton.setImage(UIImage(systemName: "gift.circle"), for: .normal)
        giftButton.tintColor = .white
        qrButton.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        qrButton.tintColor = .white
        settingButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingButton.tintColor = .white
    }
    
    func setConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view)
            make.height.equalTo(140)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(view.snp.width).multipliedBy(0.3)
            make.bottom.equalTo(bottomView.snp.top).offset(-80)
        }
        
        profileLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
        }
       
        cancelButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
        qrButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.size.equalTo(40)
            make.trailing.equalTo(settingButton.snp.leading)
        }
        giftButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.size.equalTo(40)
            make.trailing.equalTo(qrButton.snp.leading)
        }
        
    }

}
