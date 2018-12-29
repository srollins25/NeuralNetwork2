//
//  NeuralNetwork.swift
//  NeuralNetwork2
//
//  Created by stephan rollins on 12/23/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import Foundation
import UIKit
import Accelerate

class NeuralNetwork
{
    var input: Int
    var hidden: Int
    var output: Int
    var weights_ih: Matrix
    var weights_ho: Matrix
    
    var bias_h: Matrix
    var bias_o: Matrix
    var learning_rate: Double

    
    init(l1: Int, l2: Int, l3: Int) {
        self.input = l1
        self.hidden = l2
        self.output = l3
        
        self.weights_ih = Matrix(row: self.hidden, col: self.input)
        self.weights_ho = Matrix(row: self.output, col: self.hidden)
        self.weights_ih.randomize()
        self.weights_ho.randomize()
        
        self.bias_h = Matrix(row: self.hidden, col: 1)
        self.bias_o = Matrix(row: self.output, col: 1)
        self.bias_h.randomize()
        self.bias_o.randomize()
        self.learning_rate = 1.0
    }
    
    func feedforward(input_array: [Double]) -> [Double]  {
        let inputs = Matrix.fromArray(arr: input_array)
        let hidden = Matrix.multiply(a: self.weights_ih, b: inputs)
        hidden.add(n: self.bias_h)
        
        hidden.map(function: sigmoid)
        
        let output = Matrix.multiply(a: self.weights_ho, b: hidden)
        output.add(n: self.bias_o)
        output.map(function: sigmoid)
        //print("output: ", output.matrixArr)
        return output.toArray()
    }
    
//    func mutate(func: F)
//    {
//        self.weights_ih.map(function: sigmoid)
//        self.weights_ho.map(function: sigmoid)
//        self.bias_h.map(function: sigmoid)
//        self.bias_o.map(function: sigmoid)
//    }
    
    func predict(input_array: [Double]) -> [Double] {
        let inputs = Matrix.fromArray(arr: input_array)
        let hidden = Matrix.multiply(a: self.weights_ih, b: inputs)
        hidden.add(n: self.bias_h)
        
        hidden.map(function: sigmoid)
        
        let output = Matrix.multiply(a: self.weights_ho, b: hidden)
        output.add(n: self.bias_o)
        output.map(function: sigmoid)
        
        return output.toArray()
    }
    
    func sigmoid(x: Double) -> Double
    {
        //print("Output: ", (1 / (1 + exp(Double(-x)))))
        return 1.0 / (1.0 + exp(-x))
    }
    
    func dsigmoid(y: Double) -> Double {
        return Double(y * (1.0 - y))
    }
    
    func train(input_array: [Double], target_array: [Double]) {
        let inputs = Matrix.fromArray(arr: input_array)
        let hidden = Matrix.multiply(a: self.weights_ih, b: inputs)
        hidden.add(n: self.bias_h)
        
        hidden.map(function: sigmoid)
        
        let outputs = Matrix.multiply(a: self.weights_ho, b: hidden)
        outputs.add(n: self.bias_o)
        outputs.map(function: sigmoid)
        
        
        let Moutputs = Matrix.fromArray(arr: outputs.toArray())
        let Mtargets = Matrix.fromArray(arr: target_array)

        let output_errors = Matrix.subtract(a: Mtargets, b: Moutputs)
        var gradients = Matrix.map(matrix: outputs, function: dsigmoid)
        gradients = Matrix.multiply(a: outputs, b: output_errors)//index range error
        gradients.multiply(n: learning_rate)
        
        
        let hidden_t = Matrix.transpose(matrix: hidden)
        let weight_ho_deltas = Matrix.multiply(a: gradients, b: hidden_t)
        
        self.weights_ho.add(n: weight_ho_deltas)
        self.bias_o.add(n: gradients)

        
        let who_t = Matrix.transpose(matrix: self.weights_ho)
        
        let hidden_errors = Matrix.multiply(a: who_t, b: output_errors)
        
        var hidden_gradient = Matrix.map(matrix: hidden, function: dsigmoid)
        hidden_gradient = Matrix.multiply(a: hidden_gradient, b: hidden_errors)
        hidden_gradient.multiply(n: learning_rate)
        
        let inputs_t = Matrix.transpose(matrix: inputs)
        let weight_ih_deltas = Matrix.multiply(a: hidden_gradient, b: inputs_t)
        
        self.weights_ih.add(n: weight_ih_deltas)
        self.bias_h.add(n: hidden_gradient)
        
        
        print("outputs ", Moutputs.matrixArr)
        print("targets ", Mtargets.matrixArr)
        print("error: ", output_errors.matrixArr)
    }
    
}























