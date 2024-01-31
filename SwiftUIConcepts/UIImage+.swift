//
//  UIImage+.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 10/01/24.
//

import Foundation
import UIKit

extension UIImage {
    
    func addMessageAtTop(drawText text: String) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 30)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))

        let rect = CGRect(origin: CGPoint(x: 20, y: 20), size: self.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func addMessageAtTopAndImageAtCenter(drawText text: String, img: UIImage) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 30)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))

        let rect = CGRect(origin: CGPoint(x: 20, y: 20), size: self.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
