//
//  ViewController.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/12.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let data = [
                    ListModel(title: "闭包的常用使用", targetVcName: "OneViewController"),
                    ListModel(title: "代理和闭包传值的使用", targetVcName: "DelegateViewController"),
                    ListModel(title: "3", targetVcName: "")
            ]
    let lists = ListViewModel()
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "swift 常用的 demo"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        lists.data
//            .bind(to:tableView.rx.items(cellIdentifier: "UITableViewCell")) { [self]_,model,cell in
//
//                cell.textLabel?.text = model.title
//                cell.detailTextLabel?.text = model.targetVc
//                let btn = UIButton.init()
//                cell.addSubview(btn)
//                btn.setTitle("按钮", for: UIControl.State.normal)
//                btn.setTitleColor(UIColor.red, for: UIControl.State.normal)
//                btn.snp.makeConstraints{make in
//                    make.centerY.height.right.equalTo(cell)
//                    make.width.equalTo(150)
//                }
//                btn.rx.tap.asDriver()
//                    .drive(onNext: {[weak cell] in print(cell ?? "111")}).disposed(by: bag)
//            }.disposed(by: bag)
//
//
//        tableView.rx.modelSelected(ListModel.self).subscribe { model in
//            print("click \(model)")
//        }.disposed(by: bag)
//
//        tableView.rx.itemSelected.subscribe(onNext: {indexpath in print(indexpath)}).disposed(by: bag)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name:String = data[indexPath.row].targetVc
        if name.count > 0 {
            let vc = getVCByClassString(name)
            vc?.title = data[indexPath.row].title
            self.navigationController?.pushViewController(vc ?? OneViewController(), animated: true)
        }
       
    }
    
    
    func getVCByClassString(_ childControllerName: String) -> UIViewController?{
       
            // 1.获取命名空间
            // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
            guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                    print("命名空间不存在")
                    return nil
                }
            // 2.通过命名空间和类名转换成类
            let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
       
            // swift 中通过Class创建一个对象,必须告诉系统Class的类型
            guard let clsType = cls as? UIViewController.Type else {
                    print("无法转换成UIViewController")
                    return nil
                }
            // 3.通过Class创建对象
            let childController = clsType.init()
       
            return childController
    }
}

