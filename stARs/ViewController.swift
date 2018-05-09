//
//  ViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 01/03/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import MediaPlayer
import Foundation

class ViewController: UIViewController, ARSCNViewDelegate {
    
    let userDef = UserDefaults.standard
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()
    let volumeView = MPVolumeView()
    @IBOutlet var sceneView: ARSCNView!
    let imageView = UIImageView()
    var randomFx = Timer()
    var sfPlayed = false
    
    @objc func retPressed(ender: UIButton) {
        let ret = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! menuViewController
        self.present(ret, animated: true, completion: nil)
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioPlayer2.stop()
        audioPlayer2.currentTime = 0
        if sfPlayed{
            audioPlayer3.stop()
            audioPlayer3.currentTime = 0
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        let touchLocation = sender.location(in:sceneView)
        let hitTestResult = sceneView.hitTest(touchLocation, options: [:])
        if !hitTestResult.isEmpty {
            
            for hitResult in hitTestResult{
                switch hitResult.node.name {
                    case "Sun":
                            let sunInfo = UIImage(named: "sunInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        
                        break;
                    case "Mercury":
                            let sunInfo = UIImage(named: "mercuryInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                
                    case "Venus":
                            let sunInfo = UIImage(named: "venusInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                    
                    case "Earth":
                            let sunInfo = UIImage(named: "earthInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Moon":
                            let sunInfo = UIImage(named: "moonInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Mars":
                            let sunInfo = UIImage(named: "marsInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Jupiter":
                            let sunInfo = UIImage(named: "jupiterInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Saturn":
                            let sunInfo = UIImage(named: "saturnInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Uranus":
                            let sunInfo = UIImage(named: "uranusInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    case "Neptune":
                            let sunInfo = UIImage(named: "neptuneInfo")
                            imageView.frame = sceneView.frame
                            imageView.image = sunInfo
                            
                            if imageView.isHidden{
                                imageView.isHidden = false
                                playFX()
                            }else{
                                imageView.isHidden = true
                            }
                        break;
                        
                    default:
                        break;
                    
                }//Switch
                
            }//For
        
        }//If
        
    }//handleTap
    
    @objc func playFX(){
        let fx = ["rocket", "scotty", "comet", "time", "ufo"]
        let index = Int(arc4random_uniform(UInt32(fx.count)))
        let name:String = fx[index]
        do{
            audioPlayer3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3")!))
        }catch{
            print(error)
        }
        audioPlayer3.prepareToPlay()
        audioPlayer3.volume = userDef.float(forKey: "sfxVol") / 100
        audioPlayer3.play()
        print(name)
        sfPlayed = true
    }//playFX

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        sceneView.addSubview(imageView)
        
        //SPACE ODESY SFX
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "spaceOd", ofType: "mp3")!))
        }catch{
            print(error)
        }
        audioPlayer.prepareToPlay()
        
        //AMBIENT SFX
        do{
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "ambient", ofType: "mp3")!))
        }catch{
            print(error)
        }
        audioPlayer2.prepareToPlay()
        
        let vol = userDef.float(forKey: "musicVol")
        audioPlayer.volume = vol/100


        let sizeValue = userDef.object(forKey: "sizeValue") as? Int
        
        switch sizeValue {
        case 0:
            audioPlayer.play()
            audioPlayer2.play()
            audioPlayer2.volume = vol/100
            audioPlayer2.numberOfLoops = 20
            setUpPlanetsSML()
            //randomFx = Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(playFX), userInfo: nil, repeats: true)
            break;
            
        case 1:
            audioPlayer.play()
            audioPlayer2.play()
            audioPlayer2.volume = vol/100
            audioPlayer2.numberOfLoops = 20
            setUpPlanetsMED()
            //randomFx = Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(playFX), userInfo: nil, repeats: true)
            break;
            
        case 2:
            audioPlayer.play()
            audioPlayer2.play()
            audioPlayer2.volume = vol/100
            audioPlayer2.numberOfLoops = 20
            setUpPlanetsBIG()
            //randomFx = Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(playFX), userInfo: nil, repeats: true)
            break;
            
        default:
            print("lol")
        }
        
        
        setUpButton()
        
        //Set view delegate
        sceneView.delegate = self
        

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
    }//ViewDidLoad
    
    
    func setUpButton(){
        let retButton = UIButton(frame: CGRect(x: 10, y: 10, width: 45, height: 45))
        retButton.setImage(UIImage(named: "back.png"), for: .normal)
        retButton.addTarget(self, action:#selector(retPressed), for: .touchUpInside)
        self.view.addSubview(retButton)
    }
    
    func setUpPlanetsBIG(){
        let sun = SCNSphere(radius: 10) //BIG: 10
        let sunMaterial = SCNMaterial()
        
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        sun.materials = [sunMaterial]
        
        let sunNode = SCNNode()
        sunNode.position = SCNVector3(x:15, y: 0, z: -0.5) //BIG: 10 (x:15, y: 0, z: -0.5
        sunNode.geometry = sun
        
        sceneView.scene.rootNode.addChildNode(sunNode)
        sunNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.1, z: 0, duration: 1)))
        
        
        //Mercury
        let mercury = SCNSphere(radius: 0.07) //BIG: 0.07
        let mercuryMaterial = SCNMaterial()
        
        mercuryMaterial.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        mercury.materials = [mercuryMaterial]
        
        let mercuryNode = SCNNode()
        mercuryNode.position = SCNVector3(x:2, y: 0, z: -0.5) //BIG (x:2, y: 0, z: -0.5)
        mercuryNode.geometry = mercury
        
        sceneView.scene.rootNode.addChildNode(mercuryNode)
        mercuryNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //Venus
        let venus = SCNSphere(radius: 0.198) //BIG = 0.198
        let venusMaterial = SCNMaterial()
        
        venusMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        venus.materials = [venusMaterial]
        
        let venusNode = SCNNode()
        venusNode.position = SCNVector3(x:1, y: 0, z: -0.5) //BIG: (x:1, y: 0, z: -0.5)
        venusNode.geometry = venus
        
        sceneView.scene.rootNode.addChildNode(venusNode)
        venusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: -0.2, z: 0, duration: 1)))
        
        //Earth
        let earth = SCNSphere(radius: 0.2) //BIG: 0.2
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        earth.materials = [earthMaterial]
        
        let earthNode = SCNNode()
        earthNode.position = SCNVector3(x:0, y: 0, z: -0.5) //BIG: (x:0, y: 0, z: -0.5)
        earthNode.geometry = earth
        
        sceneView.scene.rootNode.addChildNode(earthNode)
        earthNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
        
        //Moon
        let moon = SCNSphere(radius: 0.05) //BIG: 0.05
        let moonMaterial = SCNMaterial()
        
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        moon.materials = [moonMaterial]
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(x:0, y:0, z :0) // BIG: (x:0, y:0, z :0)
        moonNode.geometry = moon
        
        sceneView.scene.rootNode.addChildNode(moonNode)
        moonNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //Mars
        let mars = SCNSphere(radius: 0.104) //BIG: (radius: 0.104)
        let marsMaterial = SCNMaterial()
        
        marsMaterial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        mars.materials = [marsMaterial]
        
        let marsNode = SCNNode()
        marsNode.position = SCNVector3(x:-1, y: 0, z: -0.5) //BIG: (x:-1, y: 0, z: -0.5)
        marsNode.geometry = mars
        
        sceneView.scene.rootNode.addChildNode(marsNode)
        marsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //Jupyter
        let jupiter = SCNSphere(radius: 2.25)// BIG: (radius: 2.25)
        let jupiterMat = SCNMaterial()
        
        jupiterMat.diffuse.contents = UIImage(named: "art.scnassets/jupyter.jpg")
        jupiter.materials = [jupiterMat]
        
        let jupiterNode = SCNNode()
        jupiterNode.position = SCNVector3(x:-5, y: 0, z: -0.5) //BIG: (x:-5, y: 0, z: -0.5)
        jupiterNode.geometry = jupiter
        
        sceneView.scene.rootNode.addChildNode(jupiterNode)
        jupiterNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //Saturn
        let saturn = SCNSphere(radius: 1.84) //BIG: 1.84
        let saturnMat = SCNMaterial()
        
        saturnMat.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        saturn.materials = [saturnMat]
        
        let saturnNode = SCNNode()
        saturnNode.position = SCNVector3(x:-14, y: 0, z: -0.5)//BIG:(x:-14, y: 0, z: -0.5)
        saturnNode.geometry = saturn
        
        sceneView.scene.rootNode.addChildNode(saturnNode)
        saturnNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.175, z: 0, duration: 1)))
        
        let rings = SCNTorus(ringRadius: 3.2, pipeRadius:0.2) // BIG: (ringRadius: 3.2, pipeRadius:0.2)
        let ringMat = SCNMaterial()
        ringMat.diffuse.contents = UIImage(named: "art.scnassets/rings.jpg")
        rings.materials = [ringMat]
        let ringsNode = SCNNode()
        ringsNode.position = SCNVector3(x:-14, y: 0, z: -0.5)//BIG: (x:-14, y: 0, z: -0.5)
        ringsNode.geometry = rings
        
        sceneView.scene.rootNode.addChildNode(ringsNode)
        ringsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.4, z: 0, duration: 1)))
        
        //URANUS
        let uranus = SCNSphere(radius: 0.92) //BIG: 1.84
        let uranusMat = SCNMaterial()
        
        uranusMat.diffuse.contents = UIImage(named: "art.scnassets/uranus.jpg")
        uranus.materials = [uranusMat]
        
        let uranusNode = SCNNode()
        uranusNode.position = SCNVector3(x:-24, y: 0, z: -0.5)//BIG:(x:-14, y: 0, z: -0.5)
        uranusNode.geometry = saturn
        
        sceneView.scene.rootNode.addChildNode(uranusNode)
        uranusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
        
        //NEPTUNE
        let neptune = SCNSphere(radius: 0.88)
        let neptuneMat = SCNMaterial()
        
        neptuneMat.diffuse.contents = UIImage(named: "art.scnassets/neptune.jpg")
        neptune.materials = [neptuneMat]
        
        let neptuneNode = SCNNode()
        neptuneNode.position = SCNVector3(x:-34, y: 0, z: -0.5)
        neptuneNode.geometry = neptune
        
        sceneView.scene.rootNode.addChildNode(neptuneNode)
        neptuneNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
        
        //NAMES
        sunNode.name = "Sun"
        mercuryNode.name = "Mercury"
        venusNode.name = "Venus"
        earthNode.name = "Earth"
        moonNode.name = "Moon"
        marsNode.name = "Mars"
        jupiterNode.name = "Jupiter"
        saturnNode.name = "Saturn"
        ringsNode.name = "Saturn"
        uranusNode.name = "Uranus"
        neptuneNode.name = "Neptune"
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    
    func setUpPlanetsMED(){
        let sun = SCNSphere(radius: 0.3) //BIG: 10
        let sunMaterial = SCNMaterial()
        
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        sun.materials = [sunMaterial]
        
        let sunNode = SCNNode()
        sunNode.position = SCNVector3(x:1, y: 0, z: -0.12) //BIG: 10 (x:15, y: 0, z: -0.5
        sunNode.geometry = sun
        sceneView.scene.rootNode.addChildNode(sunNode)
        sunNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.1, z: 0, duration: 1)))
        
        //Mercury
        let mercury = SCNSphere(radius: 0.0175) //BIG: 0.07
        let mercuryMaterial = SCNMaterial()
        
        mercuryMaterial.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        mercury.materials = [mercuryMaterial]
        
        let mercuryNode = SCNNode()
        mercuryNode.position = SCNVector3(x:0.375, y: 0, z: 0) //BIG (x:2, y: 0, z: -0.5)
        mercuryNode.geometry = mercury
        sceneView.scene.rootNode.addChildNode(mercuryNode)
        mercuryNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //Venus
        let venus = SCNSphere(radius: 0.0495) //BIG = 0.198
        let venusMaterial = SCNMaterial()
        
        venusMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        venus.materials = [venusMaterial]
        
        let venusNode = SCNNode()
        venusNode.position = SCNVector3(x:0.2, y: 0, z: -0.05) //BIG: (x:1, y: 0, z: -0.5)
        venusNode.geometry = venus
        sceneView.scene.rootNode.addChildNode(venusNode)
        venusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: -0.2, z: 0, duration: 1)))
        
        //Earth
        let earth = SCNSphere(radius: 0.05) //BIG: 0.2
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        earth.materials = [earthMaterial]
        
        let earthNode = SCNNode()
        earthNode.position = SCNVector3(x:0, y: 0, z: -0.05) //BIG: (x:0, y: 0, z: -0.5)
        earthNode.geometry = earth
        sceneView.scene.rootNode.addChildNode(earthNode)
        earthNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
        
        
        //Moon
        let moon = SCNSphere(radius: 0.0125) //BIG: 0.05
        let moonMaterial = SCNMaterial()
        
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        moon.materials = [moonMaterial]
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(x:0, y:0, z :0.05) // BIG: (x:0, y:0, z :0)
        moonNode.geometry = moon
        sceneView.scene.rootNode.addChildNode(moonNode)
        moonNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //Mars
        let mars = SCNSphere(radius: 0.026) //BIG: (radius: 0.104)
        let marsMaterial = SCNMaterial()
        
        marsMaterial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        mars.materials = [marsMaterial]
        
        let marsNode = SCNNode()
        marsNode.position = SCNVector3(x:-0.175, y: 0, z: 0) //BIG: (x:-1, y: 0, z: -0.5)
        marsNode.geometry = mars
        sceneView.scene.rootNode.addChildNode(marsNode)
        marsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //Jupyter
        let jupiter = SCNSphere(radius: 0.2)// BIG: (radius: 2.25)
        let jupiterMat = SCNMaterial()
        
        jupiterMat.diffuse.contents = UIImage(named: "art.scnassets/jupyter.jpg")
        jupiter.materials = [jupiterMat]
        
        let jupiterNode = SCNNode()
        jupiterNode.position = SCNVector3(x:-0.5, y: 0, z: -0.1) //BIG: (x:-5, y: 0, z: -0.5)
        jupiterNode.geometry = jupiter
        sceneView.scene.rootNode.addChildNode(jupiterNode)
        jupiterNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //Saturn
        let saturn = SCNSphere(radius: 0.16) //BIG: 1.84
        let saturnMat = SCNMaterial()
        
        saturnMat.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        saturn.materials = [saturnMat]
        
        let saturnNode = SCNNode()
        saturnNode.position = SCNVector3(x:-1.2, y: 0, z: -0.06)//BIG:(x:-14, y: 0, z: -0.5)
        saturnNode.geometry = saturn
        sceneView.scene.rootNode.addChildNode(saturnNode)
        saturnNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
        
        let rings = SCNTorus(ringRadius: 0.3, pipeRadius: 0.018) // BIG: (ringRadius: 3.2, pipeRadius:0.2)
        let ringMat = SCNMaterial()
        ringMat.diffuse.contents = UIImage(named: "art.scnassets/rings.jpg")
        rings.materials = [ringMat]
        let ringsNode = SCNNode()
        ringsNode.position = SCNVector3(x:-1.2, y: 0, z: -0.06)//BIG: (x:-14, y: 0, z: -0.5)
        ringsNode.geometry = rings
        sceneView.scene.rootNode.addChildNode(ringsNode)
        ringsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.4, z: 0, duration: 1)))
        
        //URANUS
        let uranus = SCNSphere(radius: 0.08) //BIG: 1.84
        let uranusMat = SCNMaterial()
        
        uranusMat.diffuse.contents = UIImage(named: "art.scnassets/uranus.jpg")
        uranus.materials = [uranusMat]
        
        let uranusNode = SCNNode()
        uranusNode.position = SCNVector3(x:-1.9, y: 0, z: 0)//BIG:(x:-14, y: 0, z: -0.5)
        uranusNode.geometry = uranus
        sceneView.scene.rootNode.addChildNode(uranusNode)
        uranusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //NEPTUNE
        let neptune = SCNSphere(radius: 0.078)
        let neptuneMat = SCNMaterial()
        
        neptuneMat.diffuse.contents = UIImage(named: "art.scnassets/neptune.jpg")
        neptune.materials = [neptuneMat]
        
        let neptuneNode = SCNNode()
        neptuneNode.position = SCNVector3(x:-2.6, y:0, z:0)
        neptuneNode.geometry = neptune
        sceneView.scene.rootNode.addChildNode(neptuneNode)
        neptuneNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.1, z: 0, duration: 1)))
        
        sceneView.autoenablesDefaultLighting = true
        
        //NAMES
        sunNode.name = "Sun"
        mercuryNode.name = "Mercury"
        venusNode.name = "Venus"
        earthNode.name = "Earth"
        moonNode.name = "Moon"
        marsNode.name = "Mars"
        jupiterNode.name = "Jupiter"
        saturnNode.name = "Saturn"
        ringsNode.name = "Saturn"
        uranusNode.name = "Uranus"
        neptuneNode.name = "Neptune"
    }
    
    func setUpPlanetsSML(){
        let sun = SCNSphere(radius: 0.05) //BIG: 10
        let sunMaterial = SCNMaterial()
        
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        sun.materials = [sunMaterial]
        
        let sunNode = SCNNode()
        sunNode.position = SCNVector3(x:0.22, y: 0, z: 0) //BIG: 10 (x:15, y: 0, z: -0.5
        sunNode.geometry = sun
        sceneView.scene.rootNode.addChildNode(sunNode)
        sunNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.1, z: 0, duration: 1)))
        
        //Mercury
        let mercury = SCNSphere(radius: 0.004375) //BIG: 0.07
        let mercuryMaterial = SCNMaterial()
        
        mercuryMaterial.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        mercury.materials = [mercuryMaterial]
        
        let mercuryNode = SCNNode()
        mercuryNode.position = SCNVector3(x:0.125, y: 0, z: -0.04) //BIG (x:2, y: 0, z: -0.5)
        mercuryNode.geometry = mercury
        sceneView.scene.rootNode.addChildNode(mercuryNode)
        mercuryNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //Venus
        let venus = SCNSphere(radius: 0.012375) //BIG = 0.198
        let venusMaterial = SCNMaterial()
        
        venusMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        venus.materials = [venusMaterial]
        
        let venusNode = SCNNode()
        venusNode.position = SCNVector3(x:0.06, y: 0, z: -0.05) //BIG: (x:1, y: 0, z: -0.5)
        venusNode.geometry = venus
        sceneView.scene.rootNode.addChildNode(venusNode)
        venusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: -0.2, z: 0, duration: 1)))
        
        //Earth
        let earth = SCNSphere(radius: 0.0125) //BIG: 0.2
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        earth.materials = [earthMaterial]
        
        let earthNode = SCNNode()
        earthNode.position = SCNVector3(x:0, y: 0, z: -0.05) //BIG: (x:0, y: 0, z: -0.5)
        earthNode.geometry = earth
        earthNode.name = "Earth"
        sceneView.scene.rootNode.addChildNode(earthNode)
        earthNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.3, z: 0, duration: 1)))
       
        
        
        //Moon
        let moon = SCNSphere(radius: 0.003125) //BIG: 0.05
        let moonMaterial = SCNMaterial()
        
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        moon.materials = [moonMaterial]
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(x:0, y:0, z :-0.02) // BIG: (x:0, y:0, z :0)
        moonNode.geometry = moon
        sceneView.scene.rootNode.addChildNode(moonNode)
        moonNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.1, z: 0, duration: 1)))
        
        //Mars
        let mars = SCNSphere(radius: 0.0065) //BIG: (radius: 0.104)
        let marsMaterial = SCNMaterial()
        
        marsMaterial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        mars.materials = [marsMaterial]
        
        let marsNode = SCNNode()
        marsNode.position = SCNVector3(x: -0.05, y:0, z :-0.05) //BIG: (x:-1, y: 0, z: -0.5)
        marsNode.geometry = mars
        sceneView.scene.rootNode.addChildNode(marsNode)
        marsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //Jupyter
        let jupiter = SCNSphere(radius: 0.037)// BIG: (radius: 2.25)
        let jupiterMat = SCNMaterial()
        
        jupiterMat.diffuse.contents = UIImage(named: "art.scnassets/jupyter.jpg")
        jupiter.materials = [jupiterMat]
        
        let jupiterNode = SCNNode()
        jupiterNode.position = SCNVector3(x: -0.15, y:0, z :-0.05) //BIG: (x:-5, y: 0, z: -0.5)
        jupiterNode.geometry = jupiter
        sceneView.scene.rootNode.addChildNode(jupiterNode)
        jupiterNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.4, z: 0, duration: 1)))
        
        //Saturn
        let saturn = SCNSphere(radius: 0.033) //BIG: 1.84
        let saturnMat = SCNMaterial()
        
        saturnMat.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        saturn.materials = [saturnMat]
        
        let saturnNode = SCNNode()
        saturnNode.position = SCNVector3(x: -0.32, y:0, z :-0.05)//BIG:(x:-14, y: 0, z: -0.5)
        saturnNode.geometry = saturn
        sceneView.scene.rootNode.addChildNode(saturnNode)
        saturnNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        let rings = SCNTorus(ringRadius: 0.068, pipeRadius: 0.004) // BIG: (ringRadius: 3.2, pipeRadius:0.2)
        let ringMat = SCNMaterial()
        ringMat.diffuse.contents = UIImage(named: "art.scnassets/rings.jpg")
        rings.materials = [ringMat]
        let ringsNode = SCNNode()
        ringsNode.position = SCNVector3(x: -0.32, y:0, z :-0.05)//BIG: (x:-14, y: 0, z: -0.5)
        ringsNode.geometry = rings
        sceneView.scene.rootNode.addChildNode(ringsNode)
        ringsNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        //URANUS
        let uranus = SCNSphere(radius: 0.0165) //BIG: 1.84
        let uranusMat = SCNMaterial()
        
        uranusMat.diffuse.contents = UIImage(named: "art.scnassets/uranus.jpg")
        uranus.materials = [uranusMat]
        
        let uranusNode = SCNNode()
        uranusNode.position = SCNVector3(x: -0.5, y:0, z :-0.045)//BIG:(x:-14, y: 0, z: -0.5)
        uranusNode.geometry = uranus
        sceneView.scene.rootNode.addChildNode(uranusNode)
        uranusNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.2, z: 0, duration: 1)))
        
        //NEPTUNE
        let neptune = SCNSphere(radius: 0.0160) //BIG: 1.84
        let neptuneMat = SCNMaterial()
        
        neptuneMat.diffuse.contents = UIImage(named: "art.scnassets/neptune.jpg")
        neptune.materials = [neptuneMat]
        
        let neptuneNode = SCNNode()
        neptuneNode.position = SCNVector3(x: -0.65, y:0, z :-0.045)//BIG:(x:-14, y: 0, z: -0.5)
        neptuneNode.geometry = neptune
        sceneView.scene.rootNode.addChildNode(neptuneNode)
        neptuneNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x:0, y: 0.15, z: 0, duration: 1)))
        
        sceneView.autoenablesDefaultLighting = true
        
        //NAMES
        sunNode.name = "Sun"
        mercuryNode.name = "Mercury"
        venusNode.name = "Venus"
        earthNode.name = "Earth"
        moonNode.name = "Moon"
        marsNode.name = "Mars"
        jupiterNode.name = "Jupiter"
        saturnNode.name = "Saturn"
        ringsNode.name = "Saturn"
        uranusNode.name = "Uranus"
        neptuneNode.name = "Neptune"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
}
