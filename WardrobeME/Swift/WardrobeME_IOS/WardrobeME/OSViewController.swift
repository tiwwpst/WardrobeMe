//
//  OSViewController.swift
//  WardrobeME
//
//  Created by Maxim Sukhoparov on 20.06.2021.
//

import UIKit

class OSViewController: UIViewController {

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var style: UITextField!
    @IBOutlet weak var mood: UITextField!
    
    
    let styles = ["Casual", "Sports Wear", "Classic", "Office Wear", "Street"]
    let moods = ["Cheerful", "Romantic", "Gloomy", "Mysterious", "Calm", "Lighthearted", "Angry", "Fearful", "Lonely"]
    
    var stylePickerView = UIPickerView()
    var moodPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style.inputView = stylePickerView
        mood.inputView = moodPickerView
        
        style.placeholder = "Select Style"
        mood.placeholder = "Select Mood"
        
        style.textAlignment = .center
        mood.textAlignment = .center
        
        stylePickerView.delegate = self
        stylePickerView.delegate = self
        moodPickerView.delegate = self
        moodPickerView.delegate = self
        
        stylePickerView.tag = 1
        moodPickerView.tag = 2
    }
}

extension OSViewController:
    UIPickerViewDataSource,
    UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return styles.count
        case 2:
            return moods.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return styles[row]
        case 2:
            return moods[row]
        default:
            return "data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            style.text = styles[row]
            style.resignFirstResponder()
        case 2:
            mood.text = moods[row]
            mood.resignFirstResponder()
        default:
            return
        }
    }
}



