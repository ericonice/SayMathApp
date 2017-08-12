//
//  MathTestInitiatorViewController.swift
//  SayMathApp
//
//  Created by Eric Newman on 8/11/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import UIKit

class MathTestInitiatorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var difficultyPicker: UIPickerView!

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    private func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(row+1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.difficultyPicker.dataSource = self;
        //self.difficultyPicker.delegate = self;
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
