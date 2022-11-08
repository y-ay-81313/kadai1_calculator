//
//  ViewController.swift
//  kadai1_calculator
//
//  Created by ay on 2022/10/27.
//

import UIKit

class ViewController: UIViewController {
    
    let goukeilabel = UILabel(frame: CGRect(x:40-10 , y: 150, width:300, height: 100))
    let keisanlabel = UILabel(frame: CGRect(x:40-10 , y: 50, width:300, height: 100))
    
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
    
    var hugoBox: String? = nil
    var firstNum: NSDecimalNumber? = nil
    var secondNum: NSDecimalNumber? = nil
    var isDot = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //文字列をある程度の桁数まで表示させる
        goukeilabel.adjustsFontSizeToFitWidth = true
        goukeilabel.minimumScaleFactor = 0.5
        
        //電卓のボタン配置画面設定
        layout()
        
        //画面の初期化
        reset()
        
    }
    
    func layout() {

        //背景は黒
        view.backgroundColor = .black
        
        //合計を表示するラベル設定
        goukeilabel.text = "0"
        goukeilabel.font = UIFont.systemFont(ofSize: 50.0)
        goukeilabel.backgroundColor = .black
        goukeilabel.textColor = .white
        goukeilabel.textAlignment = .right
        self.view.addSubview(goukeilabel)
        
        //計算式を表示するラベル設定
        keisanlabel.text = "0"
        keisanlabel.font = UIFont.systemFont(ofSize: 30.0)
        keisanlabel.backgroundColor = .black
        keisanlabel.textColor = .gray
        keisanlabel.textAlignment = .right
        self.view.addSubview(keisanlabel)
        
        
        setButton(button: button1, str: "1", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button2, str: "2", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button3, str: "3", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button4, str: "4", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button5, str: "5", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button6, str: "6", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button7, str: "7", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button8, str: "8", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button9, str: "9", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))
        setButton(button: button0, str: "0", bgColor: .darkGray, touchUpInsideAction: #selector(clickNum(_:)))

        setButton(button: buttonMultiple, str: "÷", bgColor: .orange, touchUpInsideAction: #selector(clickHugo(_:)))
        setButton(button: buttonDivied, str: "×", bgColor: .orange, touchUpInsideAction: #selector(clickHugo(_:)))
        setButton(button: buttonPlus, str: "+", bgColor: .orange, touchUpInsideAction: #selector(clickHugo(_:)))
        setButton(button: buttonMinus, str: "-", bgColor: .orange, touchUpInsideAction: #selector(clickHugo(_:)))
        setButton(button: buttonDot, str: ".", bgColor: .darkGray, touchUpInsideAction: #selector(clickDot(_:)))
        setButton(button: buttonEqual, str: "=", bgColor: .orange, touchUpInsideAction: #selector(clickEqual(_:)))
        setButton(button: buttonAc, str: "AC", bgColor: .darkGray, touchUpInsideAction: #selector(clickAc(_:)))
        
    }
    
    //各値の初期化
    func reset() {
        firstNum = NSDecimalNumber(0)
        secondNum = nil
        hugoBox = nil
        goukeilabel.text = "0"
        keisanlabel.text = ""
        isDot = false
    }
    
    //各数字が押された際のラベルを表示する処理
    @objc func clickNum(_ button: UIButton) {
        
        //firstNumがnilだったら、計算直後なので状態をリセットする
        if firstNum == nil{
            reset()
        }
        
        //例えば、0の時に3を押すと03じゃなくて3にする
        if goukeilabel.text == "0" {
            goukeilabel.text = button.currentTitle!
        }
        else {
            goukeilabel.text =  goukeilabel.text! + button.currentTitle!
        }
        
        if hugoBox == nil{
            //符号が押される前の数字を覚える
            firstNum = NSDecimalNumber(string: goukeilabel.text!)
        }
        else{
            //符号が押された後の数字を覚える
            secondNum = NSDecimalNumber(string: goukeilabel.text!)
        }
    }
    
    //符号が押された時の処理
    @objc func clickHugo(_ sender: UIButton) {
        
        if firstNum == nil{
            firstNum = NSDecimalNumber(string: goukeilabel.text!)
        }
        
        //連続で計算が行われた時の処理
        if secondNum != nil {
            var result = keisan()
            firstNum = result
            secondNum = nil
        }
        
        hugoBox = sender.currentTitle!
        keisanlabel.text =  firstNum!.stringValue + hugoBox!
        goukeilabel.text = "0"
        isDot = false
        
    }
    
    //小数点の「.」が押された際の処理
    @objc func clickDot(_ sender: UIButton) {
       //firstNumがnilだったら、計算直後なので状態をリセットする
        if firstNum == nil{
            reset()
        }
        //.が押されていたら何もしない
        if isDot == true{
            return
        }
    
        goukeilabel.text = goukeilabel.text! + sender.currentTitle!
        isDot = true
    }
    
    //＝が押された時の計算処理
    @objc func clickEqual(_ sender: UIButton) {
       
        var result =  keisan()
        goukeilabel.text = result.stringValue
        keisanlabel.text = ""
        firstNum = nil
        secondNum = nil
        hugoBox = nil
        isDot = false
    }
    
    //ACボタンが押された時の処理
    @objc func clickAc(_ sender: UIButton) {
        reset()
    }
    
    //計算の処理、計算が終わったら計算結果を返す
    func keisan() -> NSDecimalNumber {
        
        var result = NSDecimalNumber(0)
        
        //例えば2+=は2+2をする
        if secondNum == nil{
            secondNum = firstNum
        }
        
        switch hugoBox {
        case "+":
            //足し算の処理->adding
            result = firstNum!.adding(secondNum!)
            
        case "-":
            //引き算の処理->subtracting
            result = firstNum!.subtracting(secondNum!)
            
        case "×":
            //掛け算の処理->multiplying
            result = firstNum!.multiplying(by: secondNum!)
            
        case "÷":
            //割り算の処理->dividing
            result = firstNum!.dividing(by:secondNum!)
            
        default:
            break
        }
        //※符号が押されていない時の=は0になる
        return result
    }
    
    //ボタンが押されたら色を反転する
    @objc func reverseButtonColor(_ button:UIButton){
        let bgColor = button.backgroundColor
        button.backgroundColor = button.titleColor(for: .normal)
        button.setTitleColor(bgColor, for:.normal)
    }
    
    //各ボタンの設定
    func setButton(button:UIButton, str:String, bgColor:UIColor, touchUpInsideAction:Selector){
        button.setTitle(str, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = button.frame.height / 2
        
        button.addTarget(self, action: touchUpInsideAction, for: .touchUpInside)
        button.addTarget(self, action: #selector(reverseButtonColor(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(reverseButtonColor(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(reverseButtonColor(_:)), for: .touchUpOutside)
        self.view.addSubview(button)
        
    }
    
}
