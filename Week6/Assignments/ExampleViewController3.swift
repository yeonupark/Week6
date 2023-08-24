//
//  ExampleViewController3.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit
import SnapKit

class ExampleViewController3: UIViewController {
    
    let dateLabel = {
        let view = UILabel()
        view.text = "08월 31일 12시 12분"
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        
        return view
    }()
    
    let locationMark = {
        let view = UIImageView()
        view.image = UIImage(systemName: "location.fill")
        view.tintColor = .white
        
        return view
    }()
    
    let locationLabel = {
        let view = UILabel()
        view.text = "서울, 문래동"
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .white
        
        return view
    }()
    

    let firstLabel = {
        let view = ChatLabel()
        view.text = " 지금은 9℃예요"
        return view
    }()
    
    let secondLabel = {
        let view = ChatLabel()
        view.text = " 78% 만큼 습해요"
        return view
    }()
    
    let thirdLabel = {
        let view = ChatLabel()
        view.text = " 1m/s의 바람이 불어요"
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sky")
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true //
        
        return view
    }()
    
    let lastLabel = {
        let view = ChatLabel()
        view.text = " 오늘도 행복한 하루 보내세요"
        return view
    }()
    
    let sendButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let resetButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "lightpink")
        
        for item in [dateLabel, locationMark, locationLabel, firstLabel, secondLabel, thirdLabel, imageView, lastLabel, sendButton, resetButton] {
            view.addSubview(item)
        }
        
        setConstraints()
        
    }
    
    func setConstraints() {
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(60)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        locationMark.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationMark.snp.trailing).offset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(locationLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        secondLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(firstLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(130)
        }
        thirdLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(secondLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(thirdLabel.snp.bottom).offset(20)
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
        lastLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        resetButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(100)
            make.size.equalTo(40)
        }
        sendButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(70)
            make.top.equalToSuperview().offset(100)
            make.size.equalTo(40)
        }
        
    }

}
