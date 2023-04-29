//
//  KeyboardViewController.swift
//  Keyboard
//  Created by Dennis Li on 2022/9/16.
//

import UIKit
import Foundation
import AudioToolbox

class KeyboardViewController: UIInputViewController {
    
    var timer: Timer?
    var DeleteCount: Int!
    var LetterRocket:String! = ""
    var LetterVihicle:String! = ""
    var LetterLorry:String! = ""
    var LetterTrains:String! = ""
    var LetterPlane:String! = ""
    var shiftStatus: Int! // 0 - off, 1 - on, 2 - caps lock
    var yuanyin:String! = ""
    var yuanyinji = "üuioeɑÜUIOEA"
    var yunmuji = ["Ü","U","I","O","E","A",
                   "ü","u","i","o","e","ɑ",
                   "UN","IN","ON","OU","EN","ER","EI","AO","AN","AI",
                   "un","in","on","ou","en","er","ei","ɑo","ɑn","ɑi",
                   "UNG","ING","ONG","ANG","ENG",
                   "ung","ing","ong","ɑng","eng"]
    private var proxy: UITextDocumentProxy {
        return textDocumentProxy
    }
    //Keyboard Interface
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
    
    //ToneButtonPressed Action
    @IBAction func ToneButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == nil{
            return
        }
        // program to display numbers
        var i = 0
        while i<DeleteCount {
            proxy.deleteBackward()
            i += 1
        }
        proxy.insertText((sender.titleLabel?.text)!)
        proxy.insertText(" ")
        RowA0.isHidden = true
        AudioServicesPlaySystemSound(0x450)
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    override func viewDidLoad() {
        // Add custom view sizing constraints here
        let screenSize = UIScreen.main.bounds.size
        view.translatesAutoresizingMaskIntoConstraints = true
        if(preferredInterfaceOrientationForPresentation.isPortrait)  {
        //set protrait constraints
        RowA0.heightAnchor.constraint(equalToConstant: 45).isActive = true
        RowA1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        RowA2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        RowA3.heightAnchor.constraint(equalToConstant: 45).isActive = true
        RowA4.heightAnchor.constraint(equalToConstant: 45).isActive = true
        ThirdKeyboardButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        ThirdKeyboardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        ShiftButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        ShiftButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        DeleteButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        DeleteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        SecondaryKeybaordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        NextKeyboardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        SpaceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        let heightconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .height,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,constant: 258) // Set custom height here
        self.view.addConstraint(heightconstraint)
        let widthconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .width,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,constant: screenSize.width) // Set custom width as screen size
        self.view.addConstraint(widthconstraint)
    }
    if(preferredInterfaceOrientationForPresentation.isLandscape) {
        //set landscape constraints
        RowA0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        RowA1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        RowA2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        RowA3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        RowA4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ThirdKeyboardButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ThirdKeyboardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        ShiftButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ShiftButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        DeleteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        SecondaryKeybaordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        NextKeyboardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        SpaceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        let heightconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .height,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,constant: 200) // Set custom height here
        self.view.addConstraint(heightconstraint)
        let widthconstraint = NSLayoutConstraint(item: self.view as Any,attribute: .width,relatedBy: .equal,toItem: nil,attribute: .notAnAttribute,multiplier: 0.0,constant: screenSize.width) // Set custom width as screen size
        self.view.addConstraint(widthconstraint)
    }
    super.viewDidLoad()
    shiftStatus = 0
    DeleteCount = 0
    }
    // keypress and update the last 3 characters to placeholder
    @IBAction func keypressed(sender: UIButton) {
        
        // ButtonAnimation
        UIView.animate(withDuration: 0.04, delay: 0, options: UIView.AnimationOptions.transitionCurlUp) {
            sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 3.0)
            sender.backgroundColor = .green
            sender.contentVerticalAlignment = .top
        } completion: { Bool in
            sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            sender.backgroundColor = .systemGray2
            sender.contentVerticalAlignment = .center
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
        LetterVihicle = String(LastLetter)
        LetterLorry = String(Last2Letter)
        LetterTrains = String(Last3Letter)
        // check thirdkeyboard status
        if Last2Letter == "#+="
        { var i = 0
            while i<2 {
                proxy.deleteBackward()
                i += 1
            }
        }
        if Last2Letter == "123"
        { var i = 0
            while i<2 {
                proxy.deleteBackward()
                i += 1
            }
        }
           //update current letters
        if 1==1 {
            DeleteCount = 3
            var commonCharacters = ""
            for char in LetterTrains {
                if yuanyinji.contains(char) && !commonCharacters.contains(char) {
                    commonCharacters.append(char)
                }
                yuanyin = commonCharacters
                LetterRocket = LetterTrains
                UpdateLetters()
            }
        }
            //replace last three letters with tones
            if yunmuji.contains(LetterVihicle){
                var commonCharacters = ""
                for char in LetterVihicle {
                    if yuanyinji.contains(char) && !commonCharacters.contains(char) {
                        commonCharacters.append(char)
                    }
                }
                yuanyin = commonCharacters
                DeleteCount = 1
                LetterRocket = LetterVihicle
                UpdateLetters()
            }
            if yunmuji.contains(LetterLorry){
                var commonCharacters = ""
                for char in LetterLorry {
                    if yuanyinji.contains(char) && !commonCharacters.contains(char) {
                        commonCharacters.append(char)
                    }
                }
                yuanyin = commonCharacters
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("ɑo"){
                yuanyin = "ɑ"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("ɑi") {
                yuanyin = "ɑ"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("ei") {
                yuanyin = "e"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("ou") {
                yuanyin = "o"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("AO") {
                yuanyin = "A"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
           if  LetterLorry.contains("AI") {
                yuanyin = "A"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("EI") {
                yuanyin = "E"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if  LetterLorry.contains("OU") {
                yuanyin = "O"
                DeleteCount = 2
                LetterRocket = LetterLorry
                UpdateLetters()
            }
            if LetterVihicle != LetterLorry && LetterLorry != LetterTrains {
               if yunmuji.contains(LetterTrains){
                   var commonCharacters = ""
                   for char in LetterTrains {
                       if yuanyinji.contains(char) && !commonCharacters.contains(char) {
                           commonCharacters.append(char)
                       }
                   }
                   yuanyin = commonCharacters
                   DeleteCount = 3
                   LetterRocket = LetterTrains
                   UpdateLetters()
               }
            }
            //Play Sounds
            AudioServicesPlaySystemSound(0x450)
        }    
        // update with tones
        func UpdateLetters(){
            let Bianxing1 = yuanyin + "\u{0304}"
            let Bianxing2 = yuanyin + "\u{0301}"
            let Bianxing3 = yuanyin + "\u{030C}"
            let Bianxing4 = yuanyin + "\u{0300}"
            Tone1Button.titleLabel?.text = LetterRocket.replacingOccurrences(of: yuanyin, with: Bianxing1)
            Tone2Button.titleLabel?.text = LetterRocket.replacingOccurrences(of: yuanyin, with: Bianxing2)
            Tone3Button.titleLabel?.text = LetterRocket.replacingOccurrences(of: yuanyin, with: Bianxing3)
            Tone4Button.titleLabel?.text = LetterRocket.replacingOccurrences(of: yuanyin, with: Bianxing4)
            Tone1Button.setTitle(Tone1Button.titleLabel?.text, for: UIControl.State.normal)
            Tone2Button.setTitle(Tone2Button.titleLabel?.text, for: UIControl.State.normal)
            Tone3Button.setTitle(Tone3Button.titleLabel?.text, for: UIControl.State.normal)
            Tone4Button.setTitle(Tone4Button.titleLabel?.text, for: UIControl.State.normal)
        }
        @IBAction func SecondKeyboardKeyPressed(_ sender: UIButton) {
            if SecondaryKeybaordButton.titleLabel?.text == "ABC"{
                RowA0.isHidden = false
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
            if ThirdKeyboardButton.titleLabel?.text == "#+="{
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
                ThirdKeyboardButton.setTitle("123", for: UIControl.State.normal)
            }
            if ThirdKeyboardButton.titleLabel?.text == "123"{
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
                ThirdKeyboardButton.setTitle("#+=", for: UIControl.State.normal)
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
                UIView.animate(withDuration: 0.04, delay: 0, options: UIView.AnimationOptions.allowUserInteraction) {
                    sender.backgroundColor = .clear
                } completion: { Bool in
                    sender.backgroundColor = .black
                }
                proxy.deleteBackward()
                RowA0.isHidden = true
                AudioServicesPlaySystemSound(0x450)
                yuanyin = ""
                LetterRocket = ""
        }
        //delete button long-pressed
        @IBAction func LongPressDelete(_ sender: UILongPressGestureRecognizer) {
            if sender.state == .began {
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(handleTimer(timer:)), userInfo: nil, repeats: true)
            }
            else if sender.state == .ended || sender.state == .cancelled {
                timer?.invalidate()
                timer = nil
            }
            AudioServicesPlaySystemSound(0x450)
        }
        @objc private func handleTimer(timer: Timer) {
            proxy.deleteBackward()
        }
        //ü Button long-pressed
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
            yuanyin = ""
            LetterRocket = ""
        }
        @IBAction func returnpressed(_ sender: UIButton) {
            proxy.insertText("\n")
            AudioServicesPlaySystemSound(0x450)
        }
        @IBAction func spacepressed(_ sender: UIButton) {
            UIView.animate(withDuration: 0.04, delay: 0, options: UIView.AnimationOptions.transitionCurlUp) {
                sender.backgroundColor = .clear
            } completion: { Bool in
                sender.backgroundColor = .systemGray2
            }
            proxy.insertText(" ")
            RowA0.isHidden = true
            AudioServicesPlaySystemSound(0x450)
            yuanyin = ""
            LetterRocket = ""
        }
        @IBAction func NextKeyboardButtonPressed(_ sender: Any) {
            advanceToNextInputMode()
        }
        @IBAction func MoveCursorWhenSpaceLongPressed(_ sender: UIPanGestureRecognizer) {
            let position = sender.translation(in: SpaceButton)
            proxy.adjustTextPosition(byCharacterOffset: Int(position.x))
        }
        //Shift Button Pressed
        @IBAction func shiftbuttonpressed(_ sender: UIButton) {
            UIView.animate(withDuration: 0.04, delay: 0, options: UIView.AnimationOptions.allowUserInteraction) {
                sender.backgroundColor = .clear
            } completion: { Bool in
                sender.backgroundColor = .black
            }
            shiftStatus = shiftStatus > 0 ? 0:1
            shiftchange(containerview: RowA1)
            shiftchange(containerview: RowA2)
            shiftchange(containerview: RowA3)
            AudioServicesPlaySystemSound(0x450)
            if shiftStatus == 1 { //display 'A' button
                ALowerButton.isHidden = true
                AUpperButton.isHidden = false
            }
            if shiftStatus == 0 { //display 'a" button
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
                ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                ShiftButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            }
            if shiftStatus == 1{
                ShiftButton.setTitle("⇧", for: UIControl.State.normal)
                ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                ShiftButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
            }
            if shiftStatus == 2{
                ShiftButton.setTitle("⇪", for: UIControl.State.normal)
                ShiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
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

