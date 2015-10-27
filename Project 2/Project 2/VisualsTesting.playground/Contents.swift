//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
import UIKit
import XCPlayground






class DrawShape: UIView {
    
    var xPos: CGFloat = 256.0
    var yPos: CGFloat = 300.0
    var angle: CGFloat = 0.0 //rotation angle
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextMoveToPoint(context, xPos, yPos)
        CGContextAddLineToPoint(context, 100, 150)
        CGContextAddLineToPoint(context, 100, 250)
        CGContextAddLineToPoint(context, 200, 250)
        CGContextAddLineToPoint(context, 200, 150)
        CGContextStrokePath(context)
        
        
    }
    
    
}

let drawnThing = DrawShape()
XCPShowView("drawnThing", drawnThing)

drawnThing.drawRect(<#rect: CGRect#>)
