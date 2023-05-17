//
//  ViewController.swift
//  CounterView
//
//  Created by HPDOG on 2022/8/23.
//

import UIKit
import SnapKit

public let RGBAlpa:((Float,Float,Float,Float) -> UIColor ) = { (r: Float, g: Float , b: Float , a: Float ) -> UIColor in
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
}

class ViewController: UIViewController {
    
    let inputNumTF = UITextField()
    let counterView = CountUpView()
    let inputNumBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(inputNumTF)
        inputNumTF.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(20)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.6)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.05)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        inputNumTF.layoutIfNeeded()
        inputNumTF.layer.borderWidth = 1
        inputNumTF.layer.borderColor = UIColor.black.cgColor
        inputNumTF.layer.cornerRadius = inputNumTF.frame.height / 2
        inputNumTF.layer.masksToBounds = true
        inputNumTF.placeholder = "Enter number."
        inputNumTF.keyboardType = .numberPad
        inputNumTF.textAlignment = .center
        
        
        self.view.addSubview(inputNumBtn)
        inputNumBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.25)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.05)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        inputNumBtn.layoutIfNeeded()
        inputNumBtn.addTarget(self, action: #selector(showNum), for: .touchDown)
        inputNumBtn.layer.borderWidth = 1
        inputNumBtn.layer.borderColor = UIColor.black.cgColor
        inputNumBtn.layer.cornerRadius = 5
        inputNumBtn.layer.masksToBounds = true
        inputNumBtn.setTitle("Show", for: .normal)
        inputNumBtn.setTitleColor(.red, for: .normal)
        
        self.view.addSubview(counterView)
        counterView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.1)
        }
        counterView.setUI()
        counterView.countUpLab.textAlignment = .center
        counterView.countUpLab.font = UIFont(name: "Helvetica-Bold", size: 26)
        counterView.countUpLab.textColor = RGBAlpa(255, 87, 34, 1)
        counterView.countUpViewType = .addComma
        
    }
    
    @objc func showNum(){
        self.counterView.closeTimer()
        self.counterView.countUpStr = inputNumTF.text
        self.counterView.startTimer()
    }
    
}
