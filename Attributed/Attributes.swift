//
// Attributes.swift
//
// Copyright (c) 2016-2023 Nicholas Maccharoli
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public struct Attributes {

    public let dictionary: [NSAttributedString.Key: Any]

    public init() {
        dictionary = [:]
    }

    public init(_ attributesBlock: (Attributes) -> Attributes) {
        self = attributesBlock(Attributes())
    }

    internal init(dictionary: [NSAttributedString.Key: Any]) {
        self.dictionary = dictionary
    }

    public func font(_ font: UIFont) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.font: font])
    }

    public func kerning(_ kerning: Double) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.kern: NSNumber(floatLiteral: kerning)])
    }

    public func strikeThroughStyle(_ strikeThroughStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.strikethroughStyle: strikeThroughStyle.rawValue, NSAttributedString.Key.baselineOffset : NSNumber(floatLiteral: 1.5)])
    }

    public func underlineStyle(_ underlineStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.underlineStyle: underlineStyle.rawValue])
    }

    public func strokeColor(_ strokeColor: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.strokeColor: strokeColor])
    }

    public func strokeWidth(_ strokewidth: Double) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.strokeWidth: NSNumber(floatLiteral: strokewidth)])
    }

    public func foreground(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.foregroundColor: color])
    }

    public func background(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.backgroundColor: color])
    }

    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func shadow(_ shadow: NSShadow) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.shadow: shadow])
    }

    public func obliqueness(_ value: CGFloat) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.obliqueness: value])
    }

    public func link(_ link: String) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.link: link])
    }

    public func baselineOffset(_ offset: NSNumber) -> Attributes {
        return self + Attributes(dictionary: [NSAttributedString.Key.baselineOffset: offset])
    }
}

// MARK: NSParagraphStyle related

extension Attributes {

    public func lineSpacing(_ lineSpacing: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineSpacing = lineSpacing
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func paragraphSpacing(_ paragraphSpacing: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.paragraphSpacing =  paragraphSpacing
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func alignment(_ alignment: NSTextAlignment) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.alignment = alignment
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func firstLineHeadIndent(_ firstLineHeadIndent: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func headIndent(_ headIndent: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.headIndent = headIndent
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func tailIndent(_ tailIndent: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tailIndent = tailIndent
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = lineBreakMode
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func minimumLineHeight(_ minimumLineHeight: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.minimumLineHeight = minimumLineHeight
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func maximumLineHeight(_ maximumLineHeight: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.maximumLineHeight = maximumLineHeight
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func uniformLineHeight(_ uniformLineHeight: CGFloat) -> Attributes {
        return maximumLineHeight(uniformLineHeight).minimumLineHeight(uniformLineHeight)
    }

    public func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.baseWritingDirection = baseWritingDirection
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func lineHeightMultiple(_ lineHeightMultiple: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func paragraphSpacingBefore(_ paragraphSpacingBefore: CGFloat) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    public func hyphenationFactor(_ hyphenationFactor: Float) -> Attributes {
        let paragraphStyle = (paragraphStyle ?? NSParagraphStyle.default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.hyphenationFactor = hyphenationFactor
        return self + Attributes(dictionary: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    private var paragraphStyle: NSParagraphStyle? {
        dictionary[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle
    }
}
