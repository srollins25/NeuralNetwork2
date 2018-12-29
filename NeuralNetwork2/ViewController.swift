//
//  ViewController.swift
//  NeuralNetwork2
//
//  Created by stephan rollins on 12/23/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import UIKit


struct Traingdata {
    var inputs: [Double]
    var targets: [Double]
}

class ViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var notes: UITextView!
    var notesArr: [String] = []
    
    var brain = NeuralNetwork(l1: 2, l2: 1, l3: 1)
    var matrix = Matrix(row: 2, col: 2)
    var matrix2 = Matrix(row: 2, col: 2)
    var traingData: [Traingdata] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //matrix.add(n: 2)
        //matrix.multiply(n: 3.0)
        
        traingData.append(Traingdata(inputs: [0, 1], targets: [1]))
        traingData.append(Traingdata(inputs: [1, 0], targets: [1]))
        traingData.append(Traingdata(inputs: [0, 0], targets: [0]))
        traingData.append(Traingdata(inputs: [1, 1], targets: [0]))
        
        matrix2.add(n: 7)
        //matrix2.multiply(n: 3.0)
        matrix.matrixArr = [[2, 7], [7, 3]]
        matrix2.matrixArr = [[9, 5], [8, 1]]
        let arr = [1.0, 0, -5]
        let inputs = [1.0, 0]
        let targets = [1.0, 0]
        //var output = brain.feedforward(input_array: input)
        matrix = Matrix.fromArray(arr: arr)
        //.train(input_array: inputs, target_array: targets)
        //matrix.map(function: doubleIt)
        //matrix = Matrix.transpose(matrix: matrix)
        //matrix.multiply(n: 2.0)
       //matrix = Matrix.multiply(a: matrix, b: matrix2)
        //matrix.add(n: matrix2)
        //matrix.randomize()
        
        for i in 0 ... 500000
        {
            let data = traingData[Int.random(in: 0 ... traingData.count - 1)]
            //for data in traingData
            //{
            brain.train(input_array: data.inputs, target_array: data.targets)
            //}
        
        }
        
        print("Test:", brain.feedforward(input_array: [0, 1]))
        print("Test:", brain.feedforward(input_array: [1, 0]))
        print("Test:", brain.feedforward(input_array: [0, 0]))
        print("Test:", brain.feedforward(input_array: [1, 1]))
        print("Predict:", brain.predict(input_array: [0, 1]))
        setUI()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func doubleIt(x: Double) -> Double{
        return x * 2
    }
    
    func setUI() {
        
        for ii in 0 ..< matrix.matrixArr.count
        {
            for j in 0 ..< matrix.matrixArr[ii].count
            {
                notes.text += "\("[") \(matrix.matrixArr[ii][j])"
            }
                notes.text += "]\n"
        }

    }

}

