//
//  UIImage + Extension.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit

extension UIImage {
    
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    func rotate(radians: CGFloat) -> UIImage {
        
        let transform = CGAffineTransform(rotationAngle: radians)
        let rotatedSize = CGRect(origin: .zero, size: size).applying(transform).integral.size
        
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else {return self}
        let origin = CGPoint(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        
        context.translateBy(x: origin.x, y: origin.y)
        context.rotate(by: radians)
        
        let rect = CGRect(x: -origin.y, y: -origin.x, width: size.width, height: size.height)
        draw(in: rect)
        
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return rotatedImage ?? self
        
    }
    
}

