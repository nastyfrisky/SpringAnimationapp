//
//  ViewController.swift
//  SpringAnimationapp
//
//  Created by Анастасия Ступникова on 28.04.2022.
//

import Spring

class AnimationViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    lazy var model: Animation = generateAnimationModel()

    @IBAction func runSpringAnimation() {
        let nextModel = generateAnimationModel()
        
        if button.currentTitle == nil {
            button.setTitle(nextModel.preset, for: .normal)
            return
        }
        
        button.setTitle(nextModel.preset, for: .normal)
        
        springLabel.text = """
        preset: \(model.preset)
        curve: \(model.curve)
        force: \(model.force)
        duration: \(model.duration)
        delay: \(model.delay)
        """
        
        springAnimationView.animation = model.preset
        springAnimationView.curve = model.curve
        springAnimationView.force = model.force
        springAnimationView.duration = model.duration
        springAnimationView.delay = model.delay
        
        springAnimationView.animate()
        
        model = nextModel
    }
    
    func generateAnimationModel() -> Animation {
        Animation(
            preset: Spring.AnimationPreset.allCases.randomElement()?.rawValue ?? "",
            curve: Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? "",
            force: round(Double.random(in: 1...2) * 100) / 100,
            duration: round(Double.random(in: 1...2) * 100) / 100,
            delay: round(Double.random(in: 0...1) * 100) / 100
        )
    }
    
}

