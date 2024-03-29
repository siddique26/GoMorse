//
//  morseCode.swift
//  GoMorse
//
//  Created by Siddique on 11/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import Foundation

let toneCode:[String:(dur:Int, vol:Float)] = [
    "·": (5, 1),
    "-": (15, 1),
    "/": (30, 0),
    " ": (10, 0),
    "~": (5, 0)
]

let morseToAlphaNum: [String: String] = [
    "·-"    :"A", "-···"  :"B", "-·-·"  :"C", "-··"   :"D",
    "·"     :"E", "··-·"  :"F", "--·"   :"G", "····"  :"H",
    "··"    :"I", "·---"  :"J", "-·-"   :"K", "·-··"  :"L",
    "--"    :"M", "-·"    :"N", "---"   :"O", "·--·"  :"P",
    "--·-"  :"Q", "·-·"   :"R", "···"   :"S", "-"     :"T",
    "··-"   :"U", "···-"  :"V", "·--"   :"W", "-··-"  :"X",
    "-·--"  :"Y", "--··"  :"Z",
    
    "·----" :"1", "··---" :"2", "···--" :"3", "····-" :"4",
    "·····" :"5", "-····" :"6", "--···" :"7", "---··" :"8",
    "----·" :"9", "-----" :"0",
    
    "·-·-·-":".", "--··--":",", "··--··":"?", "·--·-·":"@"
]


