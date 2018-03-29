//
//  ViewController.swift
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

/*
extension UIView
{
    func addBorder() { /* ... */ }
    func addBackgroundColor() { /* ... */ }
}
*/

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addViewButtonTapped(_ sender: Any)
    {
        let customFrame0 = CGRect(x: 110, y: 100, width: 100, height: 100)
        let customView0 = SimpleUIViewWithBorder(frame: customFrame0)
        customView0.addBorder()
        self.view.addSubview(customView0)
        
        let customFrame1 = CGRect(x: 110, y: 210, width: 100, height: 100)
        let customView1 = UIViewWithBackground(frame: customFrame1)
        customView1.addBackgroundColor()
        self.view.addSubview(customView1)
        
        let customFrame2 = CGRect(x: 110, y: 320, width: 100, height: 100)
        let customView2 = UIViewWithBorder(borderColor: .red, borderThickness: 10.0, frame: customFrame2)
        // Cannot use mutating member on immutable value: 'customView' is a 'let' constant [*1]
        customView2.addBorder()
        self.view.addSubview(customView2)
    }
}

