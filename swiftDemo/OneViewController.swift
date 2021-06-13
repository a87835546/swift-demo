//
//  OneViewController.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/12.
//

import UIKit

class OneViewController: BaseViewController,UITextViewDelegate {
    
    @IBOutlet weak var tv: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.text = ""
        let f =  {(param1:String,param2:String)-> String in
            return param1
        }
        
        let f1:(String,String)->String = {(str1,str2) in
            return str1 + str2
        }
        
        let sum = {(num1:Int,num2:Int)->Int in
            return num1 + num2
        }
        
        let f2 = {()->String in
            return "无参待返回参数"
        }
        
        let f3:()->String = {
            return "无参待返回参数2"
        }
        print("sum:\(sum(10,10))")
        print(f2())
        print(f3())
        print(f("123","345"))
        print(f1("123","345"))
        test()
        
        print(test1(result: { str in
            print("\(str)")
        }))
    }
    
    func test()->Void{
        print("test func")
    }
    
    typealias comple = (String)->Void
    
    func test1(result:comple){
        result("把闭包当成一个参数传递")
    }
    
}
