//
//  ViewController.swift
//  1StopWatch
//
//  Created by 何吉贵 on 2018/1/18.
//  Copyright © 2018年 何吉贵. All rights reserved.
// 第一个练手小demo

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var Resert: UIButton!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Pause: UIButton!
 
    var Counter = 0.0
    var isplay = false//判断是否计时中
    var Timerone = Foundation.Timer()//var Timer : Timer?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ResertBtn(_ sender: AnyObject) {
        print("清零")
        Counter = 0
        TimeLable.text=String(Counter)
        Timerone.invalidate()
        Start.isEnabled=true
        isplay = false
    }
    @IBAction func StartBtn(_ sender: AnyObject) {
        if(isplay){
            return
        }
        else{
        Timerone = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(CreatTimer), userInfo: nil, repeats: true)
        Start.isEnabled=false
        isplay = true
        
        print("开始")
        }
    }
    @IBAction func PauseBtn(_ sender: AnyObject) {
         print("暂停")
        Timerone.invalidate()
        isplay=false
         Start.isEnabled=true
    }
  
    func CreatTimer() {
        Counter = Counter + 0.1
        TimeLable.text = String(format: "%.1f", Counter)
        
        
        
    }
}
