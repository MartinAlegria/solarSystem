//
//  menuViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 13/03/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {    

    @objc func playSystem(sender: UIButton) {
        let play = self.storyboard?.instantiateViewController(withIdentifier: "solarSystem") as! ViewController //esto ultimo es el nombre del viewController, en este caso es 'ViewController'
        self.present(play, animated: true, completion: nil)
    }
    
    
    @objc func settingsPressed(sender: UIButton) {
        let settings = self.storyboard?.instantiateViewController(withIdentifier: "settingsViewController") as! settingsViewController
        self.present(settings, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //CREAR BOTON DE PLAY
        let playButton = UIButton(frame: CGRect(x: 26, y: 217, width: 240, height: 128))
       playButton.addTarget(self, action:#selector(playSystem), for: .touchUpInside)
        playButton.setImage(UIImage(named: "play.png"), for: .normal)
        self.view.addSubview(playButton)//necesario para poder mostrar el botón
        
        //CREAR BOTON DE SETTING
        let settingsButton = UIButton(frame: CGRect(x: 387, y: 217, width: 240, height: 128))
        settingsButton.addTarget(self, action:#selector(settingsPressed), for: .touchUpInside)
        settingsButton.setImage(UIImage(named: "settings.png"), for: .normal)
        self.view.addSubview(settingsButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}//class
