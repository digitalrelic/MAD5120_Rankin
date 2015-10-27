//
//  Draw2D.swift
//  
//
//  Created by Daniel Rankin on 10/25/15.
//
//

import UIKit

class Draw2D: UIView {

    var xPos: CGFloat = 200.0
    var yPos: CGFloat = 200.0

    override func drawRect(rect: CGRect) {

        
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextMoveToPoint(context, xPos, yPos)
        CGContextAddLineToPoint(context, 150, 150)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 50, 150)
        CGContextAddLineToPoint(context, 100, 100)
        CGContextStrokePath(context)
        


}
}