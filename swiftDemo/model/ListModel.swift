//
//  ListModel.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/12.
//

import UIKit

struct ListModel {
    let title : String
    let targetVc : String
    init(title : String,targetVcName:String) {
        self.title = title
        self.targetVc = targetVcName
    }
}
