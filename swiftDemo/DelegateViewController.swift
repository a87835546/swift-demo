//
//  DelegateViewController.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/13.
//

import UIKit

protocol DelegateViewControllerDelegate:NSObjectProtocol {
    func test()
    func test1()
}
class DelegateViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource,CustomCellDelegate {
    func test(str: String) {
        print(str)
    }
    
    func clickCell() {
        print("clickBtn")

    }
    
    func clickBtn() {
        print("clickBtn")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",for: indexPath) as! CustomCell
        cell.deletage = self
        cell.strBlock = {(str1,str2) ->Void in
            print(str1+str2)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    let tableView:UITableView = UITableView()
    weak open var delegate:DelegateViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: "CustomCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        f()
    }
    
    func f (){
        delegate?.test()
    }

}

extension DelegateViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView)
    }
}
