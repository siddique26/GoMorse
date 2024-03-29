//
//  String.swift
//  GoMorse
//
//  Created by Siddique on 11/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func appendString(_ string: String, with attributes: [NSAttributedStringKey : Any])
    {
        let stringToAdd = NSAttributedString(string: string, attributes: attributes)
        self.append(stringToAdd)
    }
    func delete() {
        self.deleteCharacters(in: NSMakeRange(length - 1, 1))
    }
}

extension String {
    subscript (i:Int) -> String {
        return self[i ..< i + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    mutating func replaceMatchesTo(pattern: String, with: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSMakeRange(0, self.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: with)
        } catch {
            return
        }
    }
}
