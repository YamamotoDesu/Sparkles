//
//  ViewController.swift
//  Sparkles
//
//  Created by 山本響 on 2021/07/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayer()
    }

    private func createLayer() {
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x,
                                        y: -100)
        
        let colors: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemPink,
            .systemYellow,
            .systemPurple
        ]
        
        let cells: [CAEmitterCell] = colors.compactMap {
            let color = $0.cgColor
            return getParticle(with: color)
        }
        
        layer.emitterCells = cells
        
        view.layer.addSublayer(layer)
    }
    
    public func getParticle(with cgColor: CGColor) -> CAEmitterCell{
        //パーティクル
        let cell = CAEmitterCell()
        cell.scale = 0.005
        cell.emissionRange = .pi * 2
        
        //The lifetime of the cell, in seconds. Animatable.
        cell.lifetime = 10
        
        //The number of emitted objects created every second
        cell.birthRate = 50
        
        //The velocity of the cell will vary by a random amount within the range specified by velocityRange.
        cell.velocity = 200
        
        cell.color = cgColor
        
        // cell color
        cell.contents = UIImage(named: "image")!.cgImage
        
        return cell
        
    }

}

