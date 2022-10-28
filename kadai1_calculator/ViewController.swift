//
//  ViewController.swift
//  kadai1_calculator
//
//  Created by ay on 2022/10/27.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel(frame: CGRect(x:40-10 , y: 150, width:300, height: 100))
    
    let button1 = UIButton(frame: CGRect(x:30 , y: 480, width:70, height: 70))
    let button2 = UIButton(frame: CGRect(x:110  , y: 480, width:70, height: 70))
    let button3 = UIButton(frame: CGRect(x:190 , y: 480, width:70, height: 70))
    let button4 = UIButton(frame: CGRect(x:30 , y: 390, width:70, height: 70))
    let button5 = UIButton(frame: CGRect(x:110  , y: 390, width:70, height: 70))
    let button6 = UIButton(frame: CGRect(x:190 , y: 390, width:70, height: 70))
    let button7 = UIButton(frame: CGRect(x:30 , y: 300, width:70, height: 70))
    let button8 = UIButton(frame: CGRect(x:110  , y: 300, width:70, height: 70))
    let button9 = UIButton(frame: CGRect(x:190 , y: 300, width:70, height: 70))
    let button0 = UIButton(frame: CGRect(x:30 , y: 570, width:70, height: 70))
        
    let buttonAc = UIButton(frame: CGRect(x:190 , y: 570, width:70, height: 70))
    let buttonDivied = UIButton(frame: CGRect(x:270 , y: 300, width:70, height: 70))
    let buttonMultiple = UIButton(frame: CGRect(x:270 , y: 390, width:70, height: 70))
    let buttonMinus = UIButton(frame: CGRect(x:270 , y: 480, width:70, height: 70))
    let buttonPlus = UIButton(frame: CGRect(x:270 , y: 570, width:70, height: 70))
        
    let buttonDot = UIButton(frame: CGRect(x:110 , y: 570, width:70, height: 70))
    let buttonEqual = UIButton(frame: CGRect(x:30 , y: 660, width:300, height: 70))

    var hugoBox: String?
    var box1: String?
    var box2: String?
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //文字列を自動でサイズ変更させる
        label.adjustsFontSizeToFitWidth = true
        
        //電卓のボタン配置画面設定
        layout()
        
        //数字が押された際の処理をボタンに設定する
        setNumActions()
    }
    
    func layout() {
        
        //背景は黒
        view.backgroundColor = .black
       
        //合計を表示するラベル設定
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 50.0)
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        self.view.addSubview(label)

        //↓0〜9までのボタン設定
        button1.setTitle("1", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button1.backgroundColor = .darkGray
        button1.layer.cornerRadius = button1.frame.height / 2
        self.view.addSubview(button1)

        button2.setTitle("2", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button2.backgroundColor = .darkGray
        button2.layer.cornerRadius = button2.frame.height / 2
        self.view.addSubview(button2)

        button3.setTitle("3", for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button3.backgroundColor = .darkGray
        button3.layer.cornerRadius = button3.frame.height / 2
        self.view.addSubview(button3)

        button4.setTitle("4", for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button4.backgroundColor = .darkGray
        button4.layer.cornerRadius = button4.frame.height / 2
        self.view.addSubview(button4)

        button5.setTitle("5", for: .normal)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button5.backgroundColor = .darkGray
        button5.layer.cornerRadius = button5.frame.height / 2
        self.view.addSubview(button5)

        button6.setTitle("6", for: .normal)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button6.backgroundColor = .darkGray
        button6.layer.cornerRadius = button6.frame.height / 2
        self.view.addSubview(button6)

        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button7.backgroundColor = .darkGray
        button7.layer.cornerRadius = button7.frame.height / 2
        self.view.addSubview(button7)

        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button8.backgroundColor = .darkGray
        button8.layer.cornerRadius = button8.frame.height / 2
        self.view.addSubview(button8)

        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button9.backgroundColor = .darkGray
        button9.layer.cornerRadius = button9.frame.height / 2
        self.view.addSubview(button9)

        button0.setTitle("0", for: .normal)
        button0.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button0.backgroundColor = .darkGray
        button0.layer.cornerRadius = button0.frame.height / 2
        self.view.addSubview(button0)
        
        //符号のボタン設定
        buttonDivied.setTitle("÷", for: .normal)
        buttonDivied.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonDivied.backgroundColor = .orange
        buttonDivied.layer.cornerRadius = buttonDivied.frame.height / 2
        self.view.addSubview(buttonDivied)

        buttonMultiple.setTitle("×", for: .normal)
        buttonMultiple.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonMultiple.backgroundColor = .orange
        buttonMultiple.layer.cornerRadius = buttonMultiple.frame.height / 2
        self.view.addSubview(buttonMultiple)

        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonPlus.backgroundColor = .orange
        buttonPlus.layer.cornerRadius = buttonPlus.frame.height / 2
        self.view.addSubview(buttonPlus)

        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonMinus.backgroundColor = .orange
        buttonMinus.layer.cornerRadius = buttonMinus.frame.height / 2
        self.view.addSubview(buttonMinus)

        buttonDot.setTitle(".", for: .normal)
        buttonDot.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonDot.backgroundColor = .darkGray
        buttonDot.layer.cornerRadius = buttonDot.frame.height / 2
        self.view.addSubview(buttonDot)

        buttonEqual.setTitle("=", for: .normal)
        buttonEqual.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonEqual.backgroundColor = .orange
        buttonEqual.layer.cornerRadius = buttonEqual.frame.height / 2
        self.view.addSubview(buttonEqual)

        buttonAc.setTitle("AC", for: .normal)
        buttonAc.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonAc.backgroundColor = .lightGray
        buttonAc.setTitleColor(.black, for: .normal)
        buttonAc.layer.cornerRadius = buttonAc.frame.height / 2
        self.view.addSubview(buttonAc)

    }
    
    //各数字が押された際のラベルを表示する処理
    
    @objc func clickNum(_ button: UIButton) {
        
        let sentText = label.text!
        
        if label.text == "0" {
            label.text = button.currentTitle!
        }
        else {
            label.text =  sentText + button.currentTitle!
        }
    }
    
    func setNumActions() {

        button0.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button1.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button5.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button6.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button7.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button8.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button9.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)

    }
    
}

