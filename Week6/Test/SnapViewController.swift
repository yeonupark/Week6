//
//  SnapViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/22.
//

import UIKit
import SnapKit

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let orangeView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
            
            //make.leading.trailing.equalTo(view)
            make.horizontalEdges.equalTo(view)
            
        }
        
        view.addSubview(orangeView) // addSubview 작성 순서대로 뷰가 올라가고 보여짐
        orangeView.backgroundColor = .orange
        orangeView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            
            //make.width.height.equalTo(200)
            make.size.equalTo(200)
        }
        
        orangeView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
    }
    
}

