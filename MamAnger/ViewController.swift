//
//  ViewController.swift
//  MamAnger
//
//  Created by Rahmadani Pratiwi on 16/05/19.
//  Copyright © 2019 Rahmadani Pratiwi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var backgroundColor: UIView!
    @IBOutlet weak var colorSlider: UISlider!
    @IBOutlet weak var circle1: UIView!
    @IBOutlet weak var circle2: UIView!
    @IBOutlet weak var circle3: UIView!
    @IBOutlet weak var circle4: UIView!
    @IBOutlet weak var circle5: UIView!
    @IBOutlet weak var circle6: UIView!
    @IBOutlet weak var circle7: UIView!
    @IBOutlet weak var circle8: UIView!
    @IBOutlet weak var circle9: UIView!
    @IBOutlet weak var circle10: UIView!
    @IBOutlet weak var circle11: UIView!
    @IBOutlet weak var circle12: UIView!
    @IBOutlet weak var circle13: UIView!
    @IBOutlet weak var circle14: UIView!
    @IBOutlet weak var circle15: UIView!
    @IBOutlet weak var circle16: UIView!
    @IBOutlet weak var circle17: UIView!
    @IBOutlet weak var circle18: UIView!
    @IBOutlet weak var circle19: UIView!
    @IBOutlet weak var circle20: UIView!
    @IBOutlet weak var circle21: UIView!
    @IBOutlet weak var circle22: UIView!
    @IBOutlet weak var ovalBackground: UIView!
    
    
    var scale: Float = 0
    
    var minR: Float = (249 / 255)
    var minG: Float = (210 / 255)
    var minB: Float = (207 / 255)

    var maxR: Float = (184 / 255)
    var maxG: Float = (15 / 255)
    var maxB: Float = (10 / 255)
    
    var positionDefault: [CGPoint] = [
        CGPoint(x: 231, y: 139),//circle22
        CGPoint(x: 312, y: 158),//cirlce21
        CGPoint(x: 266, y: 174),//circle19
        CGPoint(x: 208, y: 186),//circle5
        CGPoint(x: 154, y: 177),//circle2
        CGPoint(x: 103, y: 174),//circle16
        CGPoint(x: 56, y: 158),//circle3
        CGPoint(x: 49, y: 209),//circle6
        CGPoint(x: 107, y: 223),//circle4
        CGPoint(x: 177, y: 224),//circle11
        CGPoint(x: 248, y: 222),//circle13
        CGPoint(x: 318, y: 209),//circle20
        CGPoint(x: 69, y: 258),//circle8
        CGPoint(x: 142, y: 261),//circle7
        CGPoint(x: 214, y: 260),//circle14
        CGPoint(x: 292, y: 252),//circle18
        CGPoint(x: 105, y: 296),//circle9
        CGPoint(x: 178, y: 300),//circle12
        CGPoint(x: 255, y: 291),//circle17
        CGPoint(x: 140, y: 333),//circle10
        CGPoint(x: 220, y: 327),//circle15
        CGPoint(x: 181, y: 361),//circle1
        
    ]
    
    var positionDrop: [CGPoint] = [
        CGPoint(x: 243, y: 578),
        CGPoint(x: 272, y: 551),
        CGPoint(x: 213, y: 552),
        CGPoint(x: 242, y: 528),
        CGPoint(x: 302, y: 525),
        CGPoint(x: 185, y: 524),
        CGPoint(x: 269, y: 511),
        CGPoint(x: 214, y: 500),
        CGPoint(x: 157, y: 496),
        CGPoint(x: 186, y: 473),
        CGPoint(x: 246, y: 480),
        CGPoint(x: 328, y: 495),
        CGPoint(x: 292, y: 484),
        CGPoint(x: 219, y: 453),
        CGPoint(x: 264, y: 446),
        CGPoint(x: 302, y: 448),
        CGPoint(x: 332, y: 425),
        CGPoint(x: 297, y: 411),
        CGPoint(x: 143, y: 459),
        CGPoint(x: 194, y: 422),
        CGPoint(x: 157, y: 422),
        CGPoint(x: 345, y: 460)
        
    ]
    
    var batuBatuan: [UIView] = []
    var aksi: [Int] = []
    var suara: [Int] = []

    func angerMeter() {
        scale = self.colorSlider.value
        self.backgroundColor.backgroundColor = UIColor(_colorLiteralRed: minR + (maxR - minR) * scale, green: minG + (maxG - minG) * scale, blue: minB + (maxB - minB) * scale, alpha: 1.0)
    }
    
    func animasi(batu: UIView, curPos: Float, condition: Float, defPos: CGPoint, dropPos: CGPoint) {
        let curIdx = Int(22 * condition) - 1
        
        //print(curIdx)
        
        if curPos < condition {
            batu.upBall(defPos)
            if self.aksi[curIdx] == 2 {
                self.aksi[curIdx] = 3
            }
            if self.suara[curIdx] == 0 {
                self.suara[curIdx] = 1
            }
        } else {
            batu.dropBall(dropPos)
            if self.aksi[curIdx] == 0 {
                self.aksi[curIdx] = 1
            }
            if self.suara[curIdx] == 2 {
                self.suara[curIdx] = 3
            }
        }
        
        if curIdx == 11 {
            return
        }
        if self.aksi[curIdx] == 1 {
            UIDevice.vibrate()
            self.aksi[curIdx] = 2
        } else if self.aksi[curIdx] == 3 {
            self.aksi[curIdx] = 0
        }
        if self.suara[curIdx] == 1 {
            //self.player.play()
            //sound()
            self.arrayOfPlayers[curIdx].stop()
            self.arrayOfPlayers[curIdx].prepareToPlay()
            self.arrayOfPlayers[curIdx].play()
            self.suara[curIdx] = 2
            print("play", curIdx, curPos, condition)
        } else if self.suara[curIdx] == 3 {
            self.suara[curIdx] = 0
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        self.angerMeter()
        
        let posSlider = sender.value
        
//        for i in 0...21 {
//            animasi(batu: batuBatuan[i], curPos: posSlider, condition: Float((i + 1 ) / 22), defPos: positionDefault[i], dropPos: positionDrop[i])
//        }
        
        animasi(batu: circle22, curPos: posSlider, condition: 1/22, defPos: positionDefault[0], dropPos: positionDrop[0])
        animasi(batu: circle21, curPos: posSlider, condition: 2/22, defPos: positionDefault[1], dropPos: positionDrop[1])
        animasi(batu: circle19, curPos: posSlider, condition: 3/22, defPos: positionDefault[2], dropPos: positionDrop[2])
        animasi(batu: circle5, curPos: posSlider, condition: 4/22, defPos: positionDefault[3], dropPos: positionDrop[3])
        animasi(batu: circle2, curPos: posSlider, condition: 5/22, defPos: positionDefault[4], dropPos: positionDrop[4])
        animasi(batu: circle16, curPos: posSlider, condition: 6/22, defPos: positionDefault[5], dropPos: positionDrop[5])
        animasi(batu: circle3, curPos: posSlider, condition: 7/22, defPos: positionDefault[6], dropPos: positionDrop[6])
        animasi(batu: circle6, curPos: posSlider, condition: 8/22, defPos: positionDefault[7], dropPos: positionDrop[7])
        animasi(batu: circle4, curPos: posSlider, condition: 9/22, defPos: positionDefault[8], dropPos: positionDrop[8])
        animasi(batu: circle11, curPos: posSlider, condition: 10/22, defPos: positionDefault[9], dropPos: positionDrop[9])
        animasi(batu: circle13, curPos: posSlider, condition: 11/22, defPos: positionDefault[10], dropPos: positionDrop[10])
        animasi(batu: circle20, curPos: posSlider, condition: 12/22, defPos: positionDefault[11], dropPos: positionDrop[11])
        animasi(batu: circle8, curPos: posSlider, condition: 13/22, defPos: positionDefault[12], dropPos: positionDrop[12])
        animasi(batu: circle7, curPos: posSlider, condition: 14/22, defPos: positionDefault[13], dropPos: positionDrop[13])
        animasi(batu: circle14, curPos: posSlider, condition: 15/22, defPos: positionDefault[14], dropPos: positionDrop[14])
        animasi(batu: circle18, curPos: posSlider, condition: 16/22, defPos: positionDefault[15], dropPos: positionDrop[15])
        animasi(batu: circle9, curPos: posSlider, condition: 17/22, defPos: positionDefault[16], dropPos: positionDrop[16])
        animasi(batu: circle12, curPos: posSlider, condition: 18/22, defPos: positionDefault[17], dropPos: positionDrop[17])
        animasi(batu: circle17, curPos: posSlider, condition: 19/22, defPos: positionDefault[18], dropPos: positionDrop[18])
        animasi(batu: circle10, curPos: posSlider, condition: 20/22, defPos: positionDefault[19], dropPos: positionDrop[19])
        animasi(batu: circle15, curPos: posSlider, condition: 21/22, defPos: positionDefault[20], dropPos: positionDrop[20])
        animasi(batu: circle1, curPos: posSlider, condition: 22/22, defPos: positionDefault[21], dropPos: positionDrop[21])
        
        //playSound()
        /*
        switch posSlider {
        case 0...(1/22):
            circle22.upBall(positionDefault[0])
        case (1/22)...(2/22):
            circle22.dropBall(positionDrop[0])
            circle21.upBall(positionDefault[1])
        case (2/22)...(3/22):
            circle21.dropBall(positionDrop[1])
            circle19.upBall(positionDefault[2])
        case (3/22)...(4/22):
            circle19.dropBall(positionDrop[2])
            circle5.upBall(positionDefault[3])
        case (4/22)...(5/22):
            circle5.dropBall(positionDrop[3])
            circle2.upBall(positionDefault[4])
        case (5/22)...(6/22):
            circle2.dropBall(positionDrop[4])
            circle16.upBall(positionDefault[5])
        case (6/22)...(7/22):
            circle16.dropBall(positionDrop[5])
            circle3.upBall(positionDefault[6])
        case (7/22)...(8/22):
            circle3.dropBall(positionDrop[6])
            circle6.upBall(positionDefault[7])
        case (8/22)...(9/22):
            circle6.dropBall(positionDrop[7])
            circle4.upBall(positionDefault[8])
        case (9/22)...(10/22):
            circle4.dropBall(positionDrop[8])
            circle11.upBall(positionDefault[9])
        case (10/22)...(11/22):
            circle11.dropBall(positionDrop[9])
            circle13.upBall(positionDefault[10])
        case (11/22)...(12/22):
            circle13.dropBall(positionDrop[10])
            circle20.upBall(positionDefault[11])
        case (12/22)...(13/22):
            circle20.dropBall(positionDrop[11])
            circle8.upBall(positionDefault[12])
        case (13/22)...(14/22):
            circle8.dropBall(positionDrop[12])
            circle7.upBall(positionDefault[13])
        case (14/22)...(15/22):
            circle7.dropBall(positionDrop[13])
            circle14.upBall(positionDefault[14])
        case (15/22)...(16/22):
            circle14.dropBall(positionDrop[14])
            circle18.upBall(positionDefault[15])
        case (16/22)...(17/22):
            circle18.dropBall(positionDrop[15])
            circle9.upBall(positionDefault[16])
        case (17/22)...(18/22):
            circle9.dropBall(positionDrop[16])
            circle12.upBall(positionDefault[17])
        case (18/22)...(19/22):
            circle12.dropBall(positionDrop[17])
            circle17.upBall(positionDefault[18])
        case (19/22)...(20/22):
            circle17.dropBall(positionDrop[18])
            circle10.upBall(positionDefault[19])
        case (20/22)...(21/22):
            circle10.dropBall(positionDrop[19])
            circle15.upBall(positionDefault[20])
        case (21/22)..<1:
            circle15.dropBall(positionDrop[20])
            circle1.upBall(positionDefault[21])
        case 1:
            circle1.dropBall(positionDrop[21])
        default:
            print("-")
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initSound()
        
        for _ in 1...22 {
            aksi.append(0)
        }
        
        for _ in 1...22 {
            sound()
            suara.append(2)
        }

        ovalBackground.rounded2()
        
        circle1.rounded()
        circle2.rounded()
        circle3.rounded()
        circle4.rounded()
        circle5.rounded()
        circle6.rounded()
        circle7.rounded()
        circle8.rounded()
        circle9.rounded()
        circle10.rounded()
        circle11.rounded()
        circle12.rounded()
        circle13.rounded()
        circle14.rounded()
        circle15.rounded()
        circle16.rounded()
        circle17.rounded()
        circle18.rounded()
        circle19.rounded()
        circle20.rounded()
        circle21.rounded()
        circle22.rounded()
    
        batuBatuan = [
            circle22,
            circle21,
            circle20,
            circle19,
            circle18,
            circle17,
            circle16,
            circle15,
            circle14,
            circle13,
            circle12,
            circle11,
            circle10,
            circle9,
            circle8,
            circle7,
            circle6,
            circle5,
            circle4,
            circle3,
            circle2,
            circle1,
        ]
        print(minR, minG, minB)
        
        self.backgroundColor.backgroundColor = UIColor(_colorLiteralRed: minR, green: minG, blue: minB, alpha: 1.0)
        
        let thumbImageNormal = #imageLiteral(resourceName: "thumb slider normal")
        colorSlider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = #imageLiteral(resourceName: "thumb slider highlighted")
        colorSlider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 14)

        let trackLeftImage = #imageLiteral(resourceName: "slider1")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        colorSlider.setMinimumTrackImage(trackLeftResizeable, for: .normal)

        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        colorSlider.setMaximumTrackImage(trackRightResizeable, for: .normal)
//
//        print(trackLeftResizeable, trackRightResizeable)
    }

    var arrayOfPlayers = [AVAudioPlayer]()
    func sound() {
        do {
            if let bundle = Bundle.main.path(forResource: "soundFairy", ofType: "mp3") {
                let alertSound = NSURL(fileURLWithPath: bundle)
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
                try AVAudioSession.sharedInstance().setActive(true)
                let audioPlayer = try AVAudioPlayer(contentsOf: alertSound as URL)
                arrayOfPlayers.append(audioPlayer)
                //arrayOfPlayers.last?.prepareToPlay()
                //arrayOfPlayers.last?.play()
            }
        } catch {
            print(error)
        }
    }
//    var player: AVAudioPlayer = AVAudioPlayer()
//
//    func initSound() {
//        do
//        {
//            let audiopath = Bundle.main.path(forResource: "soundFairy", ofType: "mp3")
//            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath!) as URL)
//        }
//        catch {
//
//        }
//        let session = AVAudioSession.sharedInstance()
//        do {
//            try session.setCategory(AVAudioSession.Category.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//        }
//        catch {
//        }
//        //player.play()
//    }
}


extension UIView {
    
    func rounded(){
        self.backgroundColor = .init(red: 251/255, green: 174/255, blue: 210/255, alpha: 1)
        self.layer.cornerRadius = self.frame.size.width/2
    }

    func dropBall(_ newPos: CGPoint){
        UIView.animate(withDuration: 1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.frame.origin = newPos
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.backgroundColor = .black
        }, completion: nil)
    }
    
    func upBall(_ newPos: CGPoint){
        UIView.animate(withDuration: 1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.backgroundColor = .init(red: 251/255, green: 174/255, blue: 210/255, alpha: 1)
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.frame.origin = newPos
            //UIDevice.vibrate()
        }, completion: nil)
        
    }
    
    func rounded2(){
        self.layer.cornerRadius = 25
    }
    
}


extension UIDevice {
    static func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
    let vibrate = UIImpactFeedbackGenerator(style: .medium)
    vibrate.impactOccurred()
    }
}
