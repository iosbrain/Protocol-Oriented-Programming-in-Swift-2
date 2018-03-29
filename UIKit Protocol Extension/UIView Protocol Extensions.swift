//
//  UIView Protocol Extensions.swift
//  UIKit Protocol Extension
//
//  Created by Andrew Jaffee on 3/24/18.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

import UIKit

protocol SimpleViewWithBorder {}

// SAFETY: Constrain "addBorder" only to UIViews.
extension SimpleViewWithBorder where Self : UIView
{
    // Cannot use mutating member on immutable value: 'customView' is a 'let' constant [*1]
    func addBorder() -> Void
    {
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 10.0
    }
}

class SimpleUIViewWithBorder : UIView, SimpleViewWithBorder
{
}

/*
class SimpleUIViewWithBorder : UIView, SimpleViewWithBorder
{
    // OVERRIDE OF DEFAULT EXTENSION
    func addBorder() -> Void
    {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 20.0
    }
}*/

// ----------------------------

protocol ViewWithBackground
{
    // prepended "custom" to avoid naming collision
    // with UIView
    var customBackgroundColor: UIColor { get }
}

extension ViewWithBackground where Self : UIView
{
    func addBackgroundColor() -> Void
    {
        backgroundColor = customBackgroundColor
    }
}

class UIViewWithBackground : UIView, ViewWithBackground
{
    let customBackgroundColor: UIColor = .blue
}

// ----------------------------

protocol ViewWithBorder
{
    var borderColor: UIColor { get }
    var borderThickness: CGFloat { get }
    init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect)
}

// we can constrain the shake method to only UIViews!
extension ViewWithBorder where Self : UIView
{
    // Cannot use mutating member on immutable value: 'customView' is a 'let' constant [*1]
    func addBorder() -> Void
    {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderThickness
    }
}

class UIViewWithBorder : UIView, ViewWithBorder
{
    let borderColor: UIColor
    let borderThickness: CGFloat
    
    required init(borderColor: UIColor, borderThickness: CGFloat, frame: CGRect)
    {
        self.borderColor = borderColor
        self.borderThickness = borderThickness
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
