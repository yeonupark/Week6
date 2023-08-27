//
//  PosterImageView.swift
//  Week6
//
//  Created by 마르 on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
    }
    
    // 클래스 안에서 레이아웃 잡아주기 위해서. 프레임이 잘 안먹을 때 .. 그때그때 업데이트 됨 레이지 느낌인디
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubview",frame.width, frame)
        layer.cornerRadius = frame.width / 2
    }
}
