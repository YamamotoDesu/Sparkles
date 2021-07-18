# Sparkles-Swift
Swift: Confetti Animation Effect (2021, Xcode 12, Swift 5)
https://www.youtube.com/watch?v=YosPD7eFvcE

## Requirement
- Xcode Version 12.4 (12D4e)
- Swift 5
- UIKit(CAEmitterLayer、CAEmitterCell)

## Image
![demo](https://github.com/YamamotoDesu/Sparkles/blob/main/RocketSim%20Recording%20-%20iPhone%2012%20-%202021-07-18%2015.29.05.gif)
<br><br>

## Usage
CAEmitterLayer defines the position
```swift
let layer = CAEmitterLayer()
layer.emitterPosition = CGPoint(x: view.center.x,
                                        y: -100)
```

#### Sample Code
```swift
　　 //画面レイアウト　
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
    
    //パーティクル生成
    public func getParticle(with cgColor: CGColor) -> CAEmitterCell{
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
```
