//
//  Block.swift
//  MLFindBlock
//
//  Created by stephan rollins on 12/14/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import Foundation
import UIKit

class Block {
    var block: UIView?
    var label: Int?
    //var score = 0
    //var brain = NeuralNetwork(4, 32, 4)
    //var x: Float?
    //var y: Float?
    
    init() {
        self.block = UIView()
        //self.block?.center.x = CGFloat(Float.random(in: 0 ..< Float(UIScreen.main.bounds.width)))
        //print("printing from block: ", x)
        //self.block?.center.y = CGFloat(Float.random(in: 0 ..< Float(UIScreen.main.bounds.height)))
        //print("printing from block: ", y)
        self.block?.backgroundColor = UIColor.blue
        self.block?.frame.size.width = 20
        self.block?.frame.size.height = 20
        self.Point()
        print("label: ", self.label)
    }
    
    func Point(){
        if(((self.block?.center.x.isLess(than: (self.block?.center.y)!))!))
        {
            label = 1
        }
        
        else
        {
            label = -1
        }
    }
    
    func think()  {
        let inputs = [1.0, 0.5, 0.2, 0.3]
        //let output = self.brain.predict(inputs)
        

    }
}




















