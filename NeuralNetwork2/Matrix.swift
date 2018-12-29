//
//  Matrix.swift
//  NeuralNetwork2
//
//  Created by stephan rollins on 12/23/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import Foundation
import UIKit

class Matrix {
    var matrixArr: [[Double]]
    
    
    init(row: Int, col: Int) {
        matrixArr = [[Double]](repeating: [Double](repeating: 0, count: col), count: row)
    }
    
    func add(n: Double) {
        for i in 0 ..< matrixArr.count
        {
            for j in 0 ..< matrixArr[i].count
            {
                self.matrixArr[i][j] += n
            }
        }
    }

    func add(n: Matrix) {
        for i in 0 ..< matrixArr.count
        {
            for j in 0 ..< matrixArr[i].count
            {
                self.matrixArr[i][j] += n.matrixArr[i][j]
            }
        }
    }
    
    class func fromArray(arr: [Double]) -> Matrix
    {
        let m = Matrix(row: arr.count, col: 1)
        
        for i in 0 ... arr.count -  1
        {
            m.matrixArr[i][0] = Double(arr[i])
        }
        //m.print()
        return m
    }
    
    typealias Func = (Double) -> Double
    typealias Func2 = (Double) -> Double
    
    func map(function: Func) {
        for i in 0 ..< self.matrixArr.count
        {
            for j in 0 ..< self.matrixArr[0].count
            {
                let val = self.matrixArr[i][j]
                self.matrixArr[i][j] = function(val)
            }
        }
    }
    
    class func map(matrix: Matrix, function: Func) -> Matrix
    {
        let result = Matrix(row: matrix.matrixArr.count, col: matrix.matrixArr[0].count)
        
        for i in 0 ..< matrix.matrixArr.count
        {
            for j in 0 ..< matrix.matrixArr[0].count
            {
                let val = matrix.matrixArr[i][j]
                result.matrixArr[i][j] = function(val)
            }
        }
        return result
    }
    
    func multiply(n: Double) {
        for i in 0 ..< matrixArr.count
        {
            for j in 0 ..< matrixArr[i].count
            {
                self.matrixArr[i][j] *= n
            }
        }
    }
    
    class func multiply(a: Matrix, b: Matrix) -> Matrix {
        
        let result = Matrix(row: a.matrixArr.count, col: b.matrixArr[0].count)
        var sum = 0.0
        
        for i in 0 ..< result.matrixArr.count
        {
            for j in 0 ..< result.matrixArr[0].count
            {
                sum = 0.0
                for k in 0 ..< a.matrixArr[0].count
                {
                    sum = sum + (a.matrixArr[i][k] * b.matrixArr[k][j])
                    //self.matrix[i][j] *= n.matrix[i][j]
                }
                result.matrixArr[i][j] = Double(sum)
            }
        }
        return result
    }
    
    func randomize(){
        for i in 0 ..< matrixArr.count
        {
            for j in 0 ..< matrixArr[i].count
            {
                self.matrixArr[i][j] = Double.random(in: -1 ... 1)
            }
        }
    }
    
    class func subtract(a: Matrix, b: Matrix) -> Matrix {
        let result = Matrix(row: a.matrixArr.count, col: a.matrixArr[0].count)
        for i in 0 ..< result.matrixArr.count
        {
            for j in 0 ..< result.matrixArr[0].count
            {
                result.matrixArr[i][j] = a.matrixArr[i][j] - b.matrixArr[i][j]
            }
        }
        
        return result
    }
    
    func toArray() -> [Double]
    {
        var arr = [Double]()
        
        for i in 0 ..< self.matrixArr.count
        {
            for j in 0 ..< self.matrixArr[0].count
            {
                arr.append(self.matrixArr[i][j])
            }
        }
        return arr
    }
    
    class func transpose(matrix: Matrix) -> Matrix {
        let result = Matrix(row: matrix.matrixArr[0].count, col: matrix.matrixArr.count)
        
        for i in 0 ..< matrix.matrixArr.count
        {
            for j in 0 ..< matrix.matrixArr[0].count
            {
                result.matrixArr[j][i] = matrix.matrixArr[i][j]
            }
        }
        return result
    }
}
