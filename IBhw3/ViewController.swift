//
//  ViewController.swift
//  IBhw3
//
//  Created by User22 on 2019/4/10.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var setPicture: UIImageView!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var cuteLevel: UILabel!
    @IBOutlet weak var say: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var dateP: UIDatePicker!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var eggName = ""
    var n_state:String = ""
    var n_weight:Int = 0
    var n_height:Int = 0
    var n_weight2:Int = 0
    var n_height2:Int = 0
    var n_weight3:Int = 0
    var n_height3:Int = 0
    var n_rareLevel:Int = 0
    var n_cuteLevel:Int = 0
    var n_gender:Int = 0
    var n_name:String = ""
    @IBAction func nameGet(_ sender: UIButton)
    {
        name.text = field.text
    }

    @IBAction func getNewEgg(_ sender: Any) {
        var number = Int.random(in: 1...10)
        n_weight = Int.random(in: 5...20)
        n_height = Int.random(in: 20...50)
        n_weight2 = n_weight*2
        n_height2 = n_height*2
        n_weight3 = n_weight*3
        n_height3 = n_height*3
        n_cuteLevel = Int.random(in: 1...100)
        if(number == 10)
        {
            setPicture.image = UIImage(named :"legendary")
            eggName =  "legendary"
            n_rareLevel = Int.random(in: 1...5)
        }
        else if(number < 10&&number > 6)
        {
            setPicture.image = UIImage(named :"rare")
            eggName = "rare"
        }
        else
        {
            setPicture.image = UIImage(named :"normal")
            eggName = "normal"
        }
    }
    @IBAction func chooseGender(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            n_gender = 0
        }
        else
        {
            n_gender = 1
        }
    }
   
    @IBAction func birthPicker(_ sender: UIDatePicker)
    {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "yyyy MM dd"
        birth.text = dateValue.string(from: dateP.date)
    }
    @IBAction func chooseTime(_ sender: UISwitch)
    {
        if sender.isOn
        {
            setPicture.image = UIImage(named: n_state)
        }
        else
        {
            setPicture.image = UIImage(named: "as")
        }
    }
    @IBAction func ageChange(_ sender: UISlider)
    {
        var state:Int = 0
        cuteLevel.text = "HEALTH"
        if(sender.value < 20)
        {
            if(state == 3)
            {
                n_height = n_height/3;
                n_weight = n_weight/3;
                state = 0
            }
            else if(state == 2)
            {
                n_height = n_height/2;
                n_weight = n_weight/2;
                state = 0
            }
            setPicture.image = UIImage(named:eggName)
            height.text = String(n_height)
            weight.text = String(n_weight)
            say.text = ("")
            n_state = eggName
        }
        else if(sender.value >= 20&&sender.value<40)
        {
            setPicture.image = UIImage(named:"pichu")
            height.text = String(n_height)
            weight.text = String(n_weight)
            say.text = ("皮卡皮卡")
            n_state = "pichu"
        }
        else if(sender.value >= 40 && sender.value < 70)
        {
            setPicture.image = UIImage(named:"pikachu")
            height.text = String(n_height2)
            weight.text = String(n_weight2)
            if(n_gender == 0)
            {
                say.text = ("皮卡皮卡皮卡卡！")
            }
            else
            {
                say.text = ("皮卡卡皮卡卡卡！")
            }
            n_state = "pikachu"
        }
        else
        {
            if(sender.value >= 90 && sender.value <= 100)
            {
                if(n_rareLevel == 1)
                {
                    setPicture.image = UIImage(named:"diePikachu")
                    height.text = "INFINITE"
                    weight.text = "INFINITE"
                    cuteLevel.text = "OMG 這是一個崩壞皮卡丘"
                    say.text = "我還要更多食物！！"
                    n_state = "diePikachu"
                }
                else if(n_rareLevel == 2)
                {
                    setPicture.image = UIImage(named:"lio")
                    height.text = "INFINITE"
                    weight.text = "INFINITE"
                    cuteLevel.text = "OMG 這是一個超帥皮卡丘"
                    say.text = "我會捲舌！！"
                    n_state = "lio"
                }
                else
                {
                    setPicture.image = UIImage(named:"rachu")
                    height.text = String(n_height3)
                    weight.text = String(n_weight3)
                    n_state = "rachu"
                }
            }
            else
            {
                setPicture.image = UIImage(named:"rachu")
                height.text = String(n_height3)
                weight.text = String(n_weight3)
                n_state = "rachu"
            }
        }
    }
}

