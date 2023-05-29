//
//  ViewController.swift
//  HelloUiKit
//
//  Created by Ezequiel Biglia on 24/05/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var quiantitiesTxt: UITextField!
    @IBOutlet weak var percenteageTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDowm), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1334 {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -50
            }
        }
        
    }
    
    @objc func keyboardDowm(){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        guard let quantities = quiantitiesTxt.text else {
            return
        }
        
        guard let percentage = percenteageTxt.text else{
            return
        }
        
        let quantitieFloat = (quantities as NSString).floatValue //pasar string a float
        let percentageFloat = (percentage as NSString).floatValue
        let discount = quantitieFloat * percentageFloat/100
        let calculateResult = quantitieFloat - discount
        
        resultCount(resultCount:calculateResult)
        discountCount(resultDiscount: discount)
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func btnClean(_ sender: UIButton) {
        quiantitiesTxt.text = ""
        percenteageTxt.text = ""
        result.text = "0.00"
        discount.text = "0.00"
    }
    
    func resultCount(resultCount: Float) {
        result.text = String(resultCount)
    }
    
    func discountCount(resultDiscount: Float) {
        discount.text = String(resultDiscount)
    }
    
    
}

