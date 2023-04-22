//
//  KeyboardViewController.swift
//  Keyboard
//  Created by Dennis Li on 2022/9/16.
//

import UIKit
import Foundation
import AudioToolbox


  class KeyboardViewController: UIInputViewController {
    var pickup:String! = ""
    var bufferletters:Substring! = ""
    var counter = 0
    @IBOutlet weak var AUpperButton: UIButton!
    @IBOutlet weak var ALowerButton: UIButton!
    @IBOutlet weak var NextKeyboardButton: UIButton!
    @IBOutlet weak var SpaceButton: UIButton!
    @IBOutlet weak var VButton: UIButton!
    @IBOutlet weak var Tone1Button: UIButton!
    @IBOutlet weak var Tone2Button: UIButton!
    @IBOutlet weak var Tone3Button: UIButton!
    @IBOutlet weak var Tone4Button: UIButton!
    @IBOutlet weak var SecondaryKeybaordButton: UIButton!
    @IBOutlet weak var ThirdKeyboardButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var ShiftButton: UIButton!
    var shiftStatus: Int! // 0 - off, 1 - on, 2 - caps lock
    private var proxy: UITextDocumentProxy {
        return textDocumentProxy
    }
    @IBOutlet weak var RowA0: UIStackView!
    @IBOutlet weak var RowA1: UIStackView!
    @IBOutlet weak var RowA2: UIStackView!
    @IBOutlet weak var RowA3: UIStackView!
    @IBOutlet weak var RowA4: UIStackView!
    @IBOutlet weak var RowB1: UIStackView!
    @IBOutlet weak var RowB2: UIStackView!
    @IBOutlet weak var RowB3: UIStackView!
    @IBOutlet weak var RowC1: UIStackView!
    @IBOutlet weak var RowC2: UIStackView!
    var deleteletters: Int!
    //replaceholder actions
    @IBAction func ReplacementTone1(_ sender: UIButton) {
        if sender.titleLabel?.text == nil{
                 return
             }
        // program to display numbers
        var i = 0
                while i<deleteletters {
                    proxy.deleteBackward()
                   i += 1
                }
        proxy.insertText((Tone1Button.titleLabel?.text)!)
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func ReplacementTone2(_ sender: UIButton) {
        if sender.titleLabel?.text == nil{
                 return
             }
        // program to display numbers
        var i = 0
                while i<deleteletters {
                    proxy.deleteBackward()
                   i += 1
                }
        proxy.insertText((Tone2Button.titleLabel?.text)!)
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
        }
    @IBAction func ReplacementTone3(_ sender: UIButton) {
        if sender.titleLabel?.text == nil{
                 return
             }
        var i = 0
                while i<deleteletters {
                    proxy.deleteBackward()
                   i += 1
                }
        proxy.insertText((Tone3Button.titleLabel?.text)!)
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func ReplacementTone4(_ sender: UIButton) {
        if sender.titleLabel?.text == nil{
             }
        var i = 0
                while i<deleteletters {
                    proxy.deleteBackward()
                   i += 1
                }
        proxy.insertText((Tone4Button.titleLabel?.text)!)
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
    }
    override func updateViewConstraints() {
      super.updateViewConstraints()
      // Add custom view sizing constraints here
    }
    override func viewDidLoad() {
        // Perform custom UI setup here
        // disable autoresize
        view.translatesAutoresizingMaskIntoConstraints = true
          if(preferredInterfaceOrientationForPresentation.isPortrait)  {
                       //set row landscape protrait height
                        RowA0.heightAnchor.constraint(equalToConstant: 45).isActive = true
                        RowA1.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowA2.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowA3.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowA4.heightAnchor.constraint(equalToConstant: 45).isActive = true
                        RowB1.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowB2.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowB3.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowC1.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        RowC2.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        ThirdKeyboardButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        ShiftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        //change keyboard protrait hight
                         let heightconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .height,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,
                                                                   constant: 258) // Set custom height here
                                                                   self.view.addConstraint(heightconstraint)
                         //change keyboard protrait width
                          let widthconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .width,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,
                                                                   constant: 414) // Set custom width here
                                                                   self.view.addConstraint(widthconstraint)
           }
           if(preferredInterfaceOrientationForPresentation.isLandscape) {
                      //set row landscape landscape height
                        RowA0.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowA1.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowA2.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowA3.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowA4.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowB1.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowB2.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowB3.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowC1.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        RowC2.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        ThirdKeyboardButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
                        ShiftButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
                       //change keyboard landscape hight
                         let heightconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .height,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,
                                                                   constant: 170) // Set custom height here
                                                                   self.view.addConstraint(heightconstraint)
                         //change keyboard landscape width
                          let widthconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .width,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,
                                                                   constant: 808) // Set custom width here
                                                                   self.view.addConstraint(widthconstraint)
           }
      super.viewDidLoad()
      shiftStatus = 0
      deleteletters = 0
    }
    // keypress and update the last 3 characters to placeholder
    @IBAction func keypressed(sender: UIButton) {

        // ButtonAnimation
        UIView.animate(withDuration: 0.14, delay: 0, options: UIView.AnimationOptions.transitionCurlUp) {
                    sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 2.0)
                } completion: { Bool in
                    sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                }
       // insert text
           let character = sender.titleLabel!.text!
                   proxy.insertText(character)
           // check shiftStatus
           if shiftStatus == 1 {
                    shiftbuttonpressed(self.ShiftButton)
                    }
        // replace letters with tones
        let Str3 = proxy.documentContextBeforeInput
        let Last3Letter = Str3!.suffix(3)
        let Str2 = proxy.documentContextBeforeInput
        let Last2Letter = Str2!.suffix(2)
        let Str1 = proxy.documentContextBeforeInput
        let LastLetter = Str1!.suffix(1)

                // check thirdkeyboard status
                if Last2Letter == "+-"
                { var i = 0
                            while i<2 {
                                proxy.deleteBackward()
                               i += 1
                            }
                }
                if Last2Letter == "-+"
                { var i = 0
                            while i<2 {
                                proxy.deleteBackward()
                               i += 1
                            }
                }
                //   replace tones with last three letters
                if (LastLetter.range(of: "ɑ", options: .regularExpression) == nil)
                {
                            // Counter
                    self.counter += 1
                    deleteletters = counter
                    let currentLetters = Str3!.suffix(counter)
                    Tone1Button.setTitle(String(currentLetters), for: UIControl.State.normal)
                    Tone2Button.setTitle(String(currentLetters), for: UIControl.State.normal)
                    Tone3Button.setTitle(String(currentLetters), for: UIControl.State.normal)
                    Tone4Button.setTitle(String(currentLetters), for: UIControl.State.normal)
                }
                //replace lastletter // uppercased
                if (LastLetter.range(of: "Ü", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "Ü"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "U", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "U"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "I", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "I"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "O", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "O"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "E", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "E"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "A", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "A"
                    bufferletters = LastLetter
                    replaceletters()
                }
                //replace lastletter // lowercased
                if (LastLetter.range(of: "ü", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "ü"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "u", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "u"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "i", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "i"
                    bufferletters = LastLetter
                    replaceletters()
                }

                if (LastLetter.range(of: "o", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "o"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "e", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "e"
                    bufferletters = LastLetter
                    replaceletters()
                }
                if (LastLetter.range(of: "ɑ", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 1
                    pickup = "ɑ"
                    bufferletters = LastLetter
                    replaceletters()
                }
                //replace last2letter // uppercased
                if (Last2Letter.range(of: "UN", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "U"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "IN", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "I"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ON", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "O"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "OU", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "O"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "EN", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "E"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "EI", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "E"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ER", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "E"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                
                if (Last2Letter.range(of: "AO", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "A"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "AN", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "A"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "AI", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "A"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                //replace last2letter // lowerrcased
                if (Last2Letter.range(of: "un", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "u"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "in", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "i"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "on", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "o"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ou", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "o"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "en", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "e"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "er", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "e"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ei", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "e"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ɑo", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "ɑ"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ɑn", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "ɑ"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                if (Last2Letter.range(of: "ɑi", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 2
                    pickup = "ɑ"
                    bufferletters = Last2Letter
                    replaceletters()
                }
                //replace last3letter // uppercased
                if (Last3Letter.range(of: "UNG", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "U"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ING", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "I"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ONG", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "O"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ANG", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "A"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ENG", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "E"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                //replace last3letter // lowercased
                if (Last3Letter.range(of: "ung", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "u"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ing", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "i"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ong", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "o"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "ɑng", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "ɑ"
                    bufferletters = Last3Letter
                    replaceletters()
                }
                if (Last3Letter.range(of: "eng", options: .regularExpression) != nil)
                {   counter = 0
                    deleteletters = 3
                    pickup = "e"
                    bufferletters = Last3Letter
                    replaceletters()
                }
       // AudioServicesPlaySystemSound(0x450)
        AudioServicesPlaySystemSound(0x450)
    }
    // update tone buttons
    func replaceletters(){
            let Bianxing1 = pickup + "\u{0304}"
            let Bianxing2 = pickup + "\u{0301}"
            let Bianxing3 = pickup + "\u{030C}"
            let Bianxing4 = pickup + "\u{0300}"
            Tone1Button.titleLabel?.text = bufferletters.replacingOccurrences(of: pickup, with: Bianxing1)
            Tone2Button.titleLabel?.text = bufferletters.replacingOccurrences(of: pickup, with: Bianxing2)
            Tone3Button.titleLabel?.text = bufferletters.replacingOccurrences(of: pickup, with: Bianxing3)
            Tone4Button.titleLabel?.text = bufferletters.replacingOccurrences(of: pickup, with: Bianxing4)
            Tone1Button.setTitle(Tone1Button.titleLabel?.text, for: UIControl.State.normal)
            Tone2Button.setTitle(Tone2Button.titleLabel?.text, for: UIControl.State.normal)
            Tone3Button.setTitle(Tone3Button.titleLabel?.text, for: UIControl.State.normal)
            Tone4Button.setTitle(Tone4Button.titleLabel?.text, for: UIControl.State.normal)
            }
    @IBAction func SecondKeyboardKeyPressed(_ sender: UIButton) {
        if SecondaryKeybaordButton.titleLabel?.text == "ABC"{
            RowA0.isHidden = true
            RowA1.isHidden = false
            RowA2.isHidden = false
            RowA3.isHidden = false
            RowB1.isHidden = true
            RowB2.isHidden = true
            RowB3.isHidden = true
            RowC1.isHidden = true
            RowC2.isHidden = true
            ShiftButton.isHidden = false
            ThirdKeyboardButton.isHidden = true
            DeleteButton.isHidden = false
            SecondaryKeybaordButton.setTitle("123", for: UIControl.State.normal)
        }
        if SecondaryKeybaordButton.titleLabel?.text == "123"{
            RowA0.isHidden = true
            RowA1.isHidden = true
            RowA2.isHidden = true
            RowA3.isHidden = true
            RowB1.isHidden = false
            RowB2.isHidden = false
            RowB3.isHidden = false
            RowC1.isHidden = true
            RowC2.isHidden = true
            ShiftButton.isHidden = true
            ThirdKeyboardButton.isHidden = false
            DeleteButton.isHidden = false
            SecondaryKeybaordButton.setTitle("ABC", for: UIControl.State.normal)
        }
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func ThirdKeyboardPress(_ sender: UIButton) {
        if ThirdKeyboardButton.titleLabel?.text == "+-"{
            RowA0.isHidden = true
            RowA1.isHidden = true
            RowA2.isHidden = true
            RowA3.isHidden = true
            RowB1.isHidden = true
            RowB2.isHidden = true
            RowB3.isHidden = false
            RowC1.isHidden = false
            RowC2.isHidden = false
            ShiftButton.isHidden = true
            DeleteButton.isHidden = false
            ThirdKeyboardButton.setTitle("-+", for: UIControl.State.normal)
        }
        if ThirdKeyboardButton.titleLabel?.text == "-+"{
            RowA0.isHidden = true
            RowA1.isHidden = true
            RowA2.isHidden = true
            RowA3.isHidden = true
            RowB1.isHidden = false
            RowB2.isHidden = false
            RowB3.isHidden = false
            RowC1.isHidden = true
            RowC2.isHidden = true
            ShiftButton.isHidden = true
            DeleteButton.isHidden = false
            ThirdKeyboardButton.setTitle("+-", for: UIControl.State.normal)
        }
        AudioServicesPlaySystemSound(0x450)
     }
    // Hide row0
    @IBAction func DisplayRow0(_ sender: Any) {
        RowA0.isHidden = false
    }
    //delete button pressed
    @IBAction func backspacepressed(_ sender: UIButton) {

        // ButtonAnimation
        UIView.animate(withDuration: 0.14, delay: 0, options: UIView.AnimationOptions.allowUserInteraction) {
            sender.backgroundColor = .clear
        } completion: { Bool in
            sender.backgroundColor = .black
        }
        
        proxy.deleteBackward()
        RowA0.isHidden = false
        AudioServicesPlaySystemSound(0x450)
    }
    //delete button (secondary keyboard) long pressed
    var timer: Timer?
    @IBAction func LongPressDelete(_ sender: UILongPressGestureRecognizer) {
            if sender.state == .began {
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(handleTimer(timer:)), userInfo: nil, repeats: true)
            } else if sender.state == .ended || sender.state == .cancelled {
                timer?.invalidate()
                timer = nil
                }
            AudioServicesPlaySystemSound(0x450)
    }
    @objc private func handleTimer(timer: Timer) {
            proxy.deleteBackward()
    }
    // long pressed ü to input v and their upperstate
    @IBAction func PopUpV(_ sender: UILongPressGestureRecognizer) {
            if sender.state == .began {
                if VButton.titleLabel!.text == "ü" {
                    VButton.setTitle("v", for: UIControl.State.normal)
                    proxy.insertText("v")
                }
                if VButton.titleLabel!.text == "Ü" {
                    VButton.setTitle("V", for: UIControl.State.normal)
                    proxy.insertText("V")
                }
            }
            if sender.state == .ended {
                if VButton.titleLabel!.text == "v" {
                    VButton.setTitle("ü", for: UIControl.State.normal)
                }
                if VButton.titleLabel!.text == "V" {
                    VButton.setTitle("Ü", for: UIControl.State.normal)
                }
            }
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func returnpressed(_ sender: UIButton) {
        proxy.insertText("\n")
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func spacepressed(_ sender: UIButton) {
                UIView.animate(withDuration: 0.14, delay: 0, options: UIView.AnimationOptions.transitionCurlUp) {
                    sender.backgroundColor = .clear
                } completion: { Bool in
                    sender.backgroundColor = .systemGray2
                }
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
    }
    @IBAction func NextKeyboardButtonPressed(_ sender: Any) {
        advanceToNextInputMode()
    }
    @IBAction func MoveCursorWhenSpaceLongPressed(_ sender: UIPanGestureRecognizer) {
        let position = sender.translation(in: SpaceButton)
        proxy.adjustTextPosition(byCharacterOffset: Int(position.x))
    }
    @IBAction func shiftbuttonpressed(_ sender: UIButton) {
      UIView.animate(withDuration: 0.14, delay: 0, options: UIView.AnimationOptions.allowUserInteraction) {
            sender.backgroundColor = .clear
        } completion: { Bool in
            sender.backgroundColor = .black
        }
    
        shiftStatus = shiftStatus > 0 ? 0:1
        shiftchange(containerview: RowA1)
        shiftchange(containerview: RowA2)
        shiftchange(containerview: RowA3)
        AudioServicesPlaySystemSound(0x450)
        if shiftStatus == 1 {
            ALowerButton.isHidden = true
            AUpperButton.isHidden = false
        }
        if shiftStatus == 0 {
            ALowerButton.isHidden = false
            AUpperButton.isHidden = true
        }
    }
    @IBAction func ShiftDoubleTapped(_ sender: UITapGestureRecognizer) {
        shiftStatus = 2
        shiftchange(containerview: RowA1)
        shiftchange(containerview: RowA2)
        shiftchange(containerview: RowA3)
        if shiftStatus == 2 {
            ALowerButton.isHidden = true
            AUpperButton.isHidden = false
        }
    }
    func shiftchange(containerview: UIStackView){
        for view in containerview.subviews{
            if let button = view as? UIButton{
                let buttonTitle = button.titleLabel!.text
                if shiftStatus == 0 {
                    let text = buttonTitle!.lowercased()
                    button.setTitle(text, for: UIControl.State.normal)
                } else {
                        let text = buttonTitle!.uppercased()
                    button.setTitle(text, for: UIControl.State.normal)
                }
            }
        }
        // Change Shift Button Title
        if shiftStatus == 0{
            ShiftButton.setTitle("⇧", for: UIControl.State.normal)
            ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            ShiftButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }
        if shiftStatus == 1{
            ShiftButton.setTitle("⇧", for: UIControl.State.normal)
            ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            ShiftButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
        if shiftStatus == 2{
            ShiftButton.setTitle("⇪", for: UIControl.State.normal)
            ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            ShiftButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
    }
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
    }

}

