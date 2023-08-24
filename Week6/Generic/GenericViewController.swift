//
//  GenericViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generic = sum(a: 32.2, b: 32)
        let generic2 = sum(a: 1, b: 2)
        
        title = "네비게이션 타이틀"
        view.backgroundColor = .lightGray
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .orange
        sampleLabel.text = "제네릭텍스트"
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .black
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
    }
    

}
