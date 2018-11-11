//
//  MainViewController.swift
//  add1
//
//  Created by Miles Law on 11/8/18.
//  Copyright © 2018 Miles Law. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var numbersLabel:UILabel?
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?

    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandomNumberLabel()
        updateScoreLabel()
        
        inputField?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for:UIControlEvents.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func generateRandomNumber() -> String
    {
        var result:String = ""
        
        for _ in 1...4
        {
            var digit = Int(arc4random_uniform(8)+1)
            
            result += "\(digit)"
        }
        
        return result
    }
    
    func updateScoreLabel()
    {
        scoreLabel?.text = "\(score)"
    }
    
    func setRandomNumberLabel()
    {
        numbersLabel?.text = generateRandomNumber()
    }
    @objc func textFieldDidChange(textField:UITextField)
    {
        if inputField?.text?.characters.count ?? 0 < 4
        {
            return
        }
        
        if  let numbers_text    = numbersLabel?.text,
            let input_text      = inputField?.text,
            let numbers = Int(numbers_text),
            let input   = Int(input_text)
        {
            print("Comparing: \(input_text) minus \(numbers_text) == \(input - numbers)")
            
            if(input - numbers == 1111)
            {
                print("Correct!")
                
                score += 1
            }
            else
            {
                print("Incorrect!")
                
                score -= 1
            }
        }
        
        setRandomNumberLabel()
        updateScoreLabel()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
