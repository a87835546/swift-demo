//
//  ListViewModel.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/12.
//

import UIKit
import RxCocoa
import RxSwift
struct ListViewModel {
    let data = Observable.just([
        
            ListModel(title: "闭包的常用使用", targetVcName: "OneViewController")
        ,
        
            ListModel(title: "通知代理的使用", targetVcName: "DelegateViewController")
        ,
        
            ListModel(title: "3", targetVcName: "")
        
    ])
}
