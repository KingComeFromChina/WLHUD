//
//  ViewController.swift
//  WLProgressHUD
//
//  Created by 王垒 on 2017/4/12.
//  Copyright © 2017年 王垒. All rights reserved.
//

import UIKit

private let delay : TimeInterval = 1

class ViewController: UIViewController {

   
    
    @IBOutlet var buttonCollect: [UIButton]!{
    
        didSet {
        
            buttonCollect.forEach{
            
                $0.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    
    @IBAction func successBtnClick(_ sender: Any) {
        
        WLProgressHUD.showSuccess(text: "加载成功", delay: delay)
    }

    
    @IBAction func errorBtnClick(_ sender: Any) {
        
         WLProgressHUD.showError(text: "加载失败", delay: delay)
    }
    
    
    @IBAction func infoBtnClick(_ sender: Any) {
        
        WLProgressHUD.showInfo(text: "请先登录", delay: delay)
    }
    
    @IBAction func loadingBtnClick(_ sender: Any) {
        WLProgressHUD.showLoading(text: "加载中")
        
        WLProgressHUD.hide(delay: 5)
    }
    
    @IBAction func text1BtnClick(_ sender: Any) {
        
        WLProgressHUD.showText(text: "纯swift写的HUD", delay: delay)
    }
    
    @IBAction func text2BtnClick(_ sender: Any) {
        
        let hud = WLProgressHUD(text: "岁月安好，\n嫁我可好", type: .text, delay: 0)
        hud.backgroundColor = UIColor.black
        hud.show()
        hud.hide(delay: 3)
    }
    
    
    @IBAction func hideBtnClick(_ sender: UIButton) {
        
        WLProgressHUD.hide()
        
        if sender.isSelected {
            sender.isSelected = false
            showButtonCollect()
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showButtonCollect()
    }
    
    func showButtonCollect() {
        
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        self.buttonCollect.forEach({
                            $0.isHidden = !$0.isHidden
                        })
                        
        }, completion: nil)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

