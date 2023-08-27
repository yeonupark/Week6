//
//  CustomTableViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {

    // viewDidLoad보다 클로저 구문이 먼저 실행됨
    // CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = { // '인스턴스가 생성된 직후에 나중에 초기화를 해줄게'
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. automatic dimension
        
        view.delegate = self // 자기 자신의 인스턴스를 의미함
        view.dataSource = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    //var isExpand = false // false: 2 true: 0
    var list = [Sample(text: "ㅎㅎ스트 셀 텍스트dfsfdsfdsjdshjlkjlnnjkjkjkjkjlkivvvv", isExpand: false), Sample(text: "ㅎㅇㄴㄹㅇㅎㅇㄴdsdㅏㅏㄴㄴㄴshjlkjlnnjkjkjkjkjlkivvvv", isExpand: false), Sample(text: "ㅇㅇㄴㅁㅁㅁㅁdfsfdsfdsjdshjlkjlnnjkjkjkjkjlkivvvv", isExpand: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("constraints")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function) // 열몇개 프린트됨
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = list[indexPath.row].text
        var isExpand = list[indexPath.row].isExpand
        cell.label.numberOfLines = isExpand ? 0 : 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list[indexPath.row].isExpand.toggle()
        //isExpand.toggle()
        //tableView.reloadData() // 갱신이 제일 중여함
        tableView.reloadRows(at: [indexPath, IndexPath(row: 0, section: 0)], with: .fade)
    }
}
