//
//  ViewController.swift
//  GoMorse
//
//  Created by Siddique on 09/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var morseText: String = ""
    var morseOutput = NSMutableAttributedString()
    var engOutput = NSMutableAttributedString()
    var englishAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 45)!]
    let morseAttrs = [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 45)!]
    @IBOutlet weak var morseLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func buttons(_ sender: UIButton) {
        morseText += ["·","-"," ","/"][sender.tag]
        updateOutput()
    }
    @IBAction func deleteCode(_ sender: UIButton) {
        if morseText.count > 0 {
            morseText.removeLast()
            updateOutput()
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        morseText = ""
        updateOutput()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morseLabel.text = ""
        textLabel.text = ""
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        englishAttributes.updateValue(style, forKey: NSAttributedStringKey.paragraphStyle)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func decodeToEnglish() {
        let Array = morseText.components(separatedBy: "/")
        for word in Array {
            let character = word.components(separatedBy: " ")
            for morse in character {
                if let a = morseToAlphaNum[morse] {
                    engOutput.appendString(a, with: englishAttributes)
                } else if morse != "" {
                    engOutput.appendString("\u{003D}", with: englishAttributes)
                    let idx = engOutput.length - 1
                    engOutput.addAttribute(
                        NSAttributedStringKey.foregroundColor, value: UIColor.red,
                        range: NSRange(location:idx, length:1)
                    )
                }
            }
            engOutput.appendString(" ", with: englishAttributes)
        }
        engOutput.delete()
    }
    func updateOutput() {
         engOutput = NSMutableAttributedString()
        //remove unwanted spaces
        do {
            let regex = try NSRegularExpression(pattern: "[\\/| ]{2,}", options: .caseInsensitive)
            morseText = regex.stringByReplacingMatches(in: morseText, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, morseText.count), withTemplate: "/")
        } catch let error {
            print(error)
        }
        //English Word
        decodeToEnglish()
        morseOutput = NSMutableAttributedString(string: morseText, attributes: morseAttrs)
        morseLabel.attributedText = morseOutput
        textLabel.attributedText = engOutput
    }

}

