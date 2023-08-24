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

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. automatic dimension
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // uinib - xib (storyboard) 안씀
        // 시스템셀
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function) // 열몇개 프린트됨
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
        var isExpand = list[indexPath.row].isExpand
        cell.textLabel?.numberOfLines = isExpand ? 0 : 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list[indexPath.row].isExpand.toggle()
        //isExpand.toggle()
        //tableView.reloadData() // 갱신이 제일 중여함
        tableView.reloadRows(at: [indexPath, IndexPath(row: 0, section: 0)], with: .fade)
    }
}
