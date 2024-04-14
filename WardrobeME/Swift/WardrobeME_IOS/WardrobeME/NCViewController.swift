//
//  NCViewController.swift
//  WardrobeME
//
//  Created by Maxim Sukhoparov on 19.06.2021.
//

import UIKit

class NCViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBAction func add_photo(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var weather: UITextField!
   
    let types = ["Top", "Bottom", "Shoes"]
    let weathers = ["-20°C — -15°C", "-15°C — -10°C", "-10°C — 0°C", "0°C — 10°C", "10°C — 15°C", "15°C — 20°C", "20°C — 25°C", "25+°C"]
    
    var typePickerView = UIPickerView()
    var weatherPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type.inputView = typePickerView
        weather.inputView = weatherPickerView
        
        type.placeholder = "Select Type"
        weather.placeholder = "Select Weather"
        
        type.textAlignment = .center
        weather.textAlignment = .center
        
        typePickerView.delegate = self
        typePickerView.delegate = self
        weatherPickerView.delegate = self
        weatherPickerView.delegate = self
        
        typePickerView.tag = 1
        weatherPickerView.tag = 2
    }
}

extension NCViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return types.count
        case 2:
            return weathers.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return types[row]
        case 2:
            return weathers[row]
        default:
            return "data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            type.text = types[row]
            type.resignFirstResponder()
        case 2:
            weather.text = weathers[row]
            weather.resignFirstResponder()
        default:
            return
        }
    }
}

