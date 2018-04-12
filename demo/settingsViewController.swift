//
//  settingsViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 09/04/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    
    let userDefs = UserDefaults.standard
    let step:Float = 10
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
        userDefs.set(sender.selectedSegmentIndex, forKey: "sizeValue")
        userDefs.set(sender.selectedSegmentIndex, forKey: "selectedSegment")
        userDefs.synchronize()
        
    }//SELECETED SGEMENT CHANGE
    
    @objc func musicSliderValueDidChange(_ sender:UISlider){
        
        let roundedStepValue = round(sender.value/step)*step
        
        userDefs.set(roundedStepValue, forKey: "musicVolume")
        userDefs.set(roundedStepValue, forKey: "musicVol")
        userDefs.set(true, forKey: "changed")
        
    }//SLIDERMUSICA
    
    @objc func SFXSliderValueDidChange(_ sender:UISlider){
        
        let roundedStepValue = round(sender.value/step)*step
        
        userDefs.set(roundedStepValue, forKey: "sfxVolume")
        userDefs.set(roundedStepValue, forKey: "sfxVol")
        userDefs.set(true, forKey: "changedSFX")
        
    }//SLIDERMUSICA

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let segment = userDefs.integer(forKey: "selectedSegment")
        let music = userDefs.float(forKey: "musicVol")
        let sfx = userDefs.float(forKey: "sfxVol")
        let notChanged = userDefs.bool(forKey: "changed")
        let notChangedSFX = userDefs.bool(forKey: "changedSFX")
        
        let retButton = UIButton(frame: CGRect(x: 10, y: 10, width: 45, height: 45))
        retButton.setImage(UIImage(named: "back.png"), for: .normal)
        retButton.addTarget(self, action:#selector(returnPressed), for: .touchUpInside)
        self.view.addSubview(retButton)
        
        //CREAR EL SEGMENTED CONTROL
        let sizes = ["Small", "Medium", "Big"]
        let control = UISegmentedControl(items: sizes)
       
        control.selectedSegmentIndex = segment
        
        //SET UP DEL FRAME
        control.frame = CGRect(x: 358, y: 57, width: 287, height: 35)
        control.addTarget(self, action: #selector(settingsViewController.segmentedValueChanged(_:)), for: .valueChanged)
        control.tintColor = .white
        self.view.addSubview(control)
        
        //SET UP DEL SLIDER DE MUSICA
        let sliderMusica = UISlider()
        sliderMusica.frame = CGRect(x:358, y: 170, width: 287, height: 20)
        sliderMusica.minimumValue = 0
        sliderMusica.maximumValue = 100
        
        if notChanged{
            sliderMusica.value = music
            
        }
        else{
            sliderMusica.value  = 50
        }
        
        sliderMusica.isContinuous = true
        sliderMusica.tintColor = .white
        sliderMusica.addTarget(self, action: #selector(settingsViewController.musicSliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(sliderMusica)
        
        //SET UP DEL SLIDER DE SFX
        let sliderSFX = UISlider()
        sliderSFX.frame = CGRect(x:358, y: 273, width: 287, height: 20)
        sliderSFX.minimumValue = 0
        sliderSFX.maximumValue = 100
        
        if notChangedSFX{
            sliderSFX.value = sfx
            
        }
        else{
            sliderSFX.value  = 50
        }
        
        sliderSFX.isContinuous = true
        sliderSFX.tintColor = .white
        sliderSFX.addTarget(self, action: #selector(settingsViewController.SFXSliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(sliderSFX)
        
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
