//
//  ViewController.swift
//  RocketAnimation
//
//  Created by Ashraf Mohammed on 23/02/18.
//  Copyright © 2018 Ashraf Mohammed. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var dekhoLbl: UILabel!
    @IBOutlet weak var udiLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay();
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        cloudHolder.isHidden = false
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 160, width: 375, height: 305)
        }) { (finished) in
            self.dekhoLbl.isHidden = false
            self.udiLbl.isHidden = false
        }
    }
}

