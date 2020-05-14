//
//  BubbleEmitter.swift
//  Reflection App
//
//  Created by Lorenzo on 14/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit

func addBubblesAnimation(x: CGFloat, y:CGFloat, myView: UIView ) {
    // setup emitter
    let emitter = CAEmitterLayer()
    emitter.emitterSize = CGSize(width: x - 20, height: y)
    emitter.emitterShape = CAEmitterLayerEmitterShape.line
    emitter.renderMode = .unordered
    emitter.emitterDepth = 1.0
    emitter.emitterPosition = CGPoint(x: x / 2, y: y - 55)
    myView.layer.addSublayer(emitter)
    
    let particle1 = createParticle(rate: 0.1, alpha: 0.8, scale: 0.1, velocity: 25)
    let particle2 = createParticle(rate: 0.2, alpha: 0.5, scale: 0.3, velocity: 30)
    let particle3 = createParticle(rate: 0.3, alpha: 0.6, scale: 0.8, velocity: 20)
    emitter.emitterCells = [particle1, particle2, particle3]
}

func createParticle(rate: Float, alpha: CGFloat, scale: CGFloat, velocity: CGFloat) -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.contents = UIImage(named: "Bollicine1")?.cgImage
    cell.birthRate = rate
    cell.lifetime = 2
    cell.color = UIColor(white: 0x65BC00, alpha: alpha).cgColor
    cell.alphaSpeed = -1/cell.lifetime
    cell.scale = scale
    cell.scaleRange = 0.2
    cell.alphaRange = 0.2
    cell.velocity = velocity
    cell.velocityRange = velocity * 0.3
    cell.emissionRange = 0.4
    return cell
}

