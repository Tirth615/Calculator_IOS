//
//  ViewController.swift
//  Calculator_IOS
//
//  Created by TirthShah on 07/11/24.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var CalculatorWork: UILabel!
    @IBOutlet weak var CaculatorAnsware: UILabel!
    
    var workings:String = ""
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        CalculatorWork.text = ""
        CaculatorAnsware.text = ""
    }
    
    @IBAction func Allclear(_ sender: Any)
    {
        clearAll()
    }
    @IBAction func Backtap(_ sender: Any)
    {
        if(!workings.isEmpty){
            workings.removeLast()
            CalculatorWork.text = workings
        }
    }
    
    func addtoWorkings(value:String){
        workings+=value
        CalculatorWork.text = workings
    }
     
    @IBAction func Equalstap(_ sender: Any)
    {
        if(validinput()){
            let checkedWorkings = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatresult(result: result)
            CaculatorAnsware.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Error",message: "Invalid Input",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }
        }
    
    func validinput() -> Bool{
            var count = 0
            var funCharIndexes = [Int]()
            
            for char in workings{
                if(specialCharacter(char: char)){
                    funCharIndexes.append(count)
                }
                count+=1
            }
            var previous:Int = -1
            for index in funCharIndexes {
                if(index==0){
                    return false
                }
                if(previous != -1){
                    if(index - previous == 1){
                        return false
                    }
                }
                previous = index
            }
            
            return true
    }
           
           
           func specialCharacter(char: Character)->Bool{
            if(char == "%" || char == "/" || char == "*" || char == "+" || char == "-"){
                return true
            }
               return false
        }
           
    func formatresult(result:Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func Modualtap(_ sender: Any)
    {
        addtoWorkings(value: "%")
    }
    
    @IBAction func Dividetap(_ sender: Any)
    {
        addtoWorkings(value: "/")
    }
    
    @IBAction func Multipaltap(_ sender: Any)
    {
        addtoWorkings(value: "*")
    }
    
    @IBAction func Addtap(_ sender: Any)
    {
        addtoWorkings(value: "+")
    }
    
    @IBAction func Subtap(_ sender: Any)
    {
        addtoWorkings(value: "-")
            
    }
    
    @IBAction func Dottap(_ sender: Any)
    {
        addtoWorkings(value: ".")
    }
    
    @IBAction func Onetap(_ sender: Any)
    {
        addtoWorkings(value: "1")
    }
    
    @IBAction func Twotap(_ sender: Any)
    {
        addtoWorkings(value: "2")
    }
    
    @IBAction func Threetap(_ sender: Any)
    {
        addtoWorkings(value: "3")
    }
    
    @IBAction func Fourtap(_ sender: Any)
    {
        addtoWorkings(value: "4")
    }
    
    @IBAction func Fivetap(_ sender: Any)
    {
        addtoWorkings(value: "5")
    }
    
    @IBAction func Sixtap(_ sender: Any)
    {
        addtoWorkings(value: "6")
    }
    
    @IBAction func Seventap(_ sender: Any)
    {
        addtoWorkings(value: "7")
    }
    
    @IBAction func Eighttap(_ sender: Any)
    {
        addtoWorkings(value: "8")
    }
    
    @IBAction func Ninetap(_ sender: Any)
    {
        addtoWorkings(value: "9")
    }
    
    
    
    @IBAction func Zerotap(_ sender: Any)
    {
        addtoWorkings(value: "0")
    }
    
    
}

