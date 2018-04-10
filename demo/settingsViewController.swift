//
//  settingsViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 09/04/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        switch sender.selectedSegmentIndex
        {
        case 0:
            print("hola")
        case 1:
            print("hola")
        case 2:
            print("hola")
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let retButton = UIButton(frame: CGRect(x: 10, y: 10, width: 45, height: 45))
        retButton.setImage(UIImage(named: "back.png"), for: .normal)
        retButton.addTarget(self, action:#selector(returnPressed), for: .touchUpInside)
        self.view.addSubview(retButton)
        
        //CREAR EL SEGMENTED CONTROL
        let sizes = ["Small", "Medium", "Big"]
        let control = UISegmentedControl(items: sizes)
        control.selectedSegmentIndex = 0
        
        //SET UP DEL FRAME
        control.frame = CGRect(x: 368, y: 59, width: 237, height: 28)
         control.addTarget(self, action: #selector(settingsViewController.segmentedValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(control)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func returnPressed(sender: UIButton) {
        let ret = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! menuViewController
        self.present(ret, animated: true, completion: nil)
    }
    

}
