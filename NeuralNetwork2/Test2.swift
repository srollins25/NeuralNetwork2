//
//  Test2.swift
//  NeuralNetwork2
//
//  Created by stephan rollins on 12/28/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//

import Foundation
import UIKit

class Test2: UIViewController, UITextViewDelegate {
    
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
    
    let button: UIButton = {
       let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.magenta.cgColor
        button.setTitle("Test", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        //button.addTarget(self, action: #selector(tan), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let bLabel: UILabel = {
        let label = UILabel()
        label.text = "Black"
        label.font = label.font.withSize(22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let wLabel: UILabel = {
        let label = UILabel()
        label.text = "White"
        label.font = label.font.withSize(22)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var brain = NeuralNetwork(l1: 3, l2: 3, l3: 2)


    
    
    
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
        

        setUI()
    }
    

    


    func setUI()
    {
        view.addSubview(panel)
        view.addSubview(slider)
        view.addSubview(button)
        panel.addSubview(bLabel)
        panel.addSubview(wLabel)
        //panel.addSubview(guess)
        
        panel.frame.size.width = 300
        panel.frame.size.height = 300
        
        panel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        panel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        panel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        panel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270).isActive = true
        //slider.heightAnchor.constraint(equalToConstant: 400).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        
        bLabel.centerXAnchor.constraint(equalTo: panel.centerXAnchor, constant: -100).isActive = true
        bLabel.centerYAnchor.constraint(equalTo: panel.centerYAnchor).isActive = true
        
        wLabel.centerXAnchor.constraint(equalTo: panel.centerXAnchor, constant: 100).isActive = true
        wLabel.centerYAnchor.constraint(equalTo: panel.centerYAnchor).isActive = true
        
        //guess.centerXAnchor.constraint(equalTo: panel.centerXAnchor).isActive = true
        //guess.centerYAnchor.constraint(equalTo: panel.centerYAnchor).isActive = true
        
    }
    

}
