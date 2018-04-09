//
//  settingsViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 09/04/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let retButton = UIButton(frame: CGRect(x: 16, y: 36, width: 45, height: 45))
        retButton.backgroundColor = .black
        retButton.setTitle("RET", for: .normal)
        retButton.addTarget(self, action:#selector(returnPressed), for: .touchUpInside)
        self.view.addSubview(retButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func returnPressed(sender: UIButton) {
        let ret = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! menuViewController
        self.present(ret, animated: true, completion: nil)
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
