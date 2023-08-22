//
//  ExampleViewController1.swift
//  Week6
//
//  Created by 마르 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleViewController1: UIViewController {

    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .line
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        
        return view
    }()
    
    let dateTextField = {
        let view = UITextField()
        view.borderStyle = .line
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        
        return view
    }()
    
    let contentTextfield = {
        let view = UITextField()
        view.borderStyle = .line
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(contentTextfield)
        contentTextfield.addSubview(dateTextField)
        dateTextField.addSubview(titleTextField)
        titleTextField.addSubview(imageView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        contentTextfield.snp.makeConstraints { make in
            make.size.equalTo(view.snp.width).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentTextfield)
            make.height.equalTo(40)
            make.bottom.equalTo(contentTextfield.snp.top).inset(-20)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
            make.bottom.equalTo(dateTextField.snp.top).inset(-20)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottomMargin.equalTo(titleTextField.snp.top).inset(-20)
        }
    }
}
