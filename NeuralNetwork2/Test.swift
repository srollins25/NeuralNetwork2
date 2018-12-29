//
//  Test.swift
//  NeuralNetwork2
//
//  Created by stephan rollins on 12/25/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import Foundation
import UIKit

class Test: UIViewController, UITextViewDelegate {
    
    let panel: UIView = {
        let panel = UIView()
        panel.backgroundColor = UIColor.blue
        panel.translatesAutoresizingMaskIntoConstraints = false
        return panel
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.tintColor = UIColor.green
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var brain = NeuralNetwork(l1: 2, l2: 2, l3: 1)
    var trainingData: [Traingdata] = []
    var trainingData2 = [[Block]](repeating: [Block](repeating: Block(), count: 200/10), count: 200/10)
    let finishBlock = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
//        finishBlock.frame.size.width = 30
//        finishBlock.frame.size.height = 30
//        finishBlock.backgroundColor = UIColor.green
//        finishBlock.center.x = 200
//        finishBlock.center.y = 200
//
//        view.addSubview(finishBlock)
        
        var a = UIView()
        var b = UIView()

        a.backgroundColor = UIColor.green
        a.frame.size.width = 40
        a.frame.size.height = 40
        print(a.center.x)
        b.backgroundColor = UIColor.orange
        b.frame.size.width = 40
        b.frame.size.height = 40
        b.center.x = b.center.x + b.center.x
        print(b.center.x)

        self.panel.addSubview(a)
        
        self.panel.addSubview(b)
        
        setData()
        
        setUI()
        
        draw()
        
        start()
        
    }
    
    func draw() {
        for i in 0 ..< 100
        {
            var data = trainingData[Int.random(in: 0 ... trainingData.count - 1)]
            brain.train(input_array: data.inputs, target_array: data.targets)
        }
        
        var resolution: CGFloat = 10
        var k = 0

        for i in 0 ..< Int(panel.frame.width / resolution)
        {
            for j in 0 ..< Int(panel.frame.height / resolution)
            {
                var x1 = CGFloat(i) / panel.frame.width / resolution
                var x2 = CGFloat(j) / panel.frame.height / resolution
                var inputs = [Double(x1), Double(x2)]
                var y = brain.predict(input_array: inputs)
                print("y:",y)
                
                trainingData2[i][j] = Block()
                //if(j % 2 == 0 || i % 2 == 0)
                //{
                trainingData2[i][j].block?.backgroundColor = UIColor.init(white: CGFloat(y[0] ), alpha: 1)
                print(trainingData2[i][j].block?.backgroundColor)
                //}
                //else
                //{
                 //   trainingData2[i][j].block?.backgroundColor = UIColor.green
                //}
                //v.backgroundColor = UIColor.black
                trainingData2[i][j].block?.center.y *= CGFloat(i + 1)
                trainingData2[i][j].block?.center.x *= CGFloat(j)
                self.panel.addSubview(trainingData2[i][j].block!)
            }
        }
    }
    
//    func setcolor() -> [Double]
//    {
//
//    }
    
    func setData(){
        trainingData.append(Traingdata(inputs: [0, 0], targets: [0]))
        trainingData.append(Traingdata(inputs: [0, 1], targets: [1]))
        trainingData.append(Traingdata(inputs: [1, 0], targets: [1]))
        trainingData.append(Traingdata(inputs: [1, 1], targets: [0]))
    }
    
    func setUI()
    {
        view.addSubview(panel)
        view.addSubview(slider)

        panel.frame.size.width = 200
        panel.frame.size.height = 200
        
        panel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        panel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        panel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        panel.widthAnchor.constraint(equalToConstant: 200).isActive = true

        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270).isActive = true
        //slider.heightAnchor.constraint(equalToConstant: 400).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 400).isActive = true
        

    }
    
    func start(){
        print("test", panel.frame.size.height)
        print(panel.frame.size.height / 10)
    }
}
