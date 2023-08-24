//
//  TextViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    // 1. ImagePickerController 등록
    let picker = UIImagePickerController()

    let photoImageView = {
        
        let view = UIImageView()
        view.backgroundColor = .orange
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let titleTextField = {
        
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [photoImageView,titleTextField].forEach {
            view.addSubview($0)
        }
        
        setupConstraints()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 2. available한지 체크
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
            return
        }
        picker.delegate = self
        picker.sourceType = .camera  //.photoLibrary
        picker.allowsEditing = true
        
        //let picker = UIColorPickerViewController()
        
        present(picker, animated: true)
    }
    
    func setupConstraints() {
        // 레이아웃 잘 바뀌지도 않는데, 맨날 들여다 볼 필요 없으니 숨겨놓자
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            //make.leadingMargin.equalTo(20)
            make.leading.equalToSuperview().inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
    }

}

// 3. 프로토콜 선언
extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출 **
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}
