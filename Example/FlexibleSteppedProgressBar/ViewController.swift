//
//  ViewController.swift
//  FlexibleSteppedProgressBar
//
//  Created by Amrata Baghel on 09/28/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

class ViewController: UIViewController, FlexibleSteppedProgressBarDelegate {

    var progressBar: FlexibleSteppedProgressBar!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    var progressBarWithDifferentDimensions: FlexibleSteppedProgressBar!
    
    var lightBackground = UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    var backgroundColor = UIColor.clear

    var progressColor = UIColor(red: 53.0 / 255.0, green: 226.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
    var maxIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundColor = self.view.backgroundColor ?? .clear
        
        //setupProgressBar()
        //setupProgressBarWithoutLastState()
        
        setupProgressBarWithDifferentDimensions()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.progressBarWithDifferentDimensions.setNeedsDisplay()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupProgressBarWithoutLastState() {
        progressBarWithoutLastState = FlexibleSteppedProgressBar()
        progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBarWithoutLastState)
        
        // iOS9+ auto layout code
        let horizontalConstraint = progressBarWithoutLastState.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = progressBarWithoutLastState.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 300
        )
        let widthConstraint = progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: 450)
        let heightConstraint = progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Customise the progress bar here
        progressBarWithoutLastState.numberOfPoints = 4
        progressBarWithoutLastState.lineHeight = 3
        progressBarWithoutLastState.radius = 20
        progressBarWithoutLastState.progressRadius = 25
        progressBarWithoutLastState.progressLineHeight = 3
        progressBarWithoutLastState.delegate = self
        progressBarWithoutLastState.selectedBackgoundColor = progressColor
        progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor
        progressBarWithoutLastState.currentSelectedCenterColor = progressColor
        progressBarWithoutLastState.stepTextColor = textColorHere
        progressBarWithoutLastState.currentSelectedTextColor = progressColor
        
        progressBarWithoutLastState.currentIndex = 0
        
    }
    
    func setupProgressBarWithDifferentDimensions() {
        progressBarWithDifferentDimensions = FlexibleSteppedProgressBar()
        progressBarWithDifferentDimensions.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBarWithDifferentDimensions)
        
        // iOS9+ auto layout code
        let horizontalConstraint = progressBarWithDifferentDimensions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = progressBarWithDifferentDimensions.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 450
        )
        let widthConstraint = progressBarWithDifferentDimensions.widthAnchor.constraint(equalToConstant: 450)
        let heightConstraint = progressBarWithDifferentDimensions.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        progressBarWithDifferentDimensions.numberOfPoints = 5
        progressBarWithDifferentDimensions.lineHeight = 3
        progressBarWithDifferentDimensions.radius = 25 //15
        progressBarWithDifferentDimensions.progressRadius = 25 //11
        progressBarWithDifferentDimensions.progressLineHeight = 3
        progressBarWithDifferentDimensions.delegate = self
        progressBarWithDifferentDimensions.useLastState = false
        progressBarWithDifferentDimensions.lastStateCenterColor = UIColor.green
        progressBarWithDifferentDimensions.selectedBackgoundColor = UIColor.green
        progressBarWithDifferentDimensions.selectedOuterCircleStrokeColor = lightBackground
        progressBarWithDifferentDimensions.selectedOuterCircleLineWidth = 5
        progressBarWithDifferentDimensions.currentSelectedCenterColor = lightBackground
        progressBarWithDifferentDimensions.stepTextColor = textColorHere
        progressBarWithDifferentDimensions.centerLayerTextColor = UIColor.clear
        progressBarWithDifferentDimensions.centerLayerDarkBackgroundTextColor = UIColor.clear
        progressBarWithDifferentDimensions.currentSelectedTextColor = UIColor.black
        progressBarWithDifferentDimensions.completedTillIndex = 0
        progressBarWithDifferentDimensions.centerLayerTextFont = UIFont(name: "AvenirNext-Regular", size: 40)
        progressBarWithDifferentDimensions.selectedTextFont = UIFont(name: "AvenirNext-DemiBold", size: 16)
        progressBarWithDifferentDimensions.stepTextFont = UIFont(name: "AvenirNext-Regular", size: 16)
        progressBarWithDifferentDimensions.progressIsAllDone = true
        
        progressBarWithDifferentDimensions.currentIndex = 4
        
    }
    
    func setupProgressBar() {
        progressBar = FlexibleSteppedProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBar)
        
        // iOS9+ auto layout code
        let horizontalConstraint = progressBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = progressBar.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 80
        )
        let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: CGFloat(450))
        let heightConstraint = progressBar.heightAnchor.constraint(equalToConstant: CGFloat(150))
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Customise the progress bar here
        progressBar.numberOfPoints = 5
        progressBar.lineHeight = 9
        progressBar.radius = 15
        progressBar.progressRadius = 25
        progressBar.progressLineHeight = 3
        progressBar.delegate = self
        progressBar.completedTillIndex = 2
        progressBar.useLastState = true
        progressBar.lastStateCenterColor = progressColor
        progressBar.selectedBackgoundColor = progressColor
        progressBar.selectedOuterCircleStrokeColor = backgroundColor
        progressBar.lastStateOuterCircleStrokeColor = backgroundColor
        progressBar.currentSelectedCenterColor = progressColor
        progressBar.currentSelectedTextColor = progressColor
        
        
        progressBar.currentIndex = 0
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
        
        progressBar.currentIndex = index
        if index > maxIndex {
            maxIndex = index
        }
        
        
        
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return true
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, selectedTextAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> UIImage? {
        
        if progressBar == self.progressBarWithDifferentDimensions  {
            if position == FlexibleSteppedProgressBarTextLocation.center {
                let image = UIImage(named: "whiteCheck64")
                return image
            }
        }
        
        return nil
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if progressBar == self.progressBar || progressBar == self.progressBarWithoutLastState {
            if position == FlexibleSteppedProgressBarTextLocation.top {
                switch index {
                    
                case 0: return "Choose"
                case 1: return "Click"
                case 2: return "Checkout"
                case 3: return "Buy"
                case 4: return "Pay"
                default: return "Step"
                    
                }
            } else if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "First"
                case 1: return "Second"
                case 2: return "Third"
                case 3: return "Fourth"
                case 4: return "Fifth"
                default: return "Date"
                    
                }
                
            } else if position == FlexibleSteppedProgressBarTextLocation.center {
                switch index {
                    
                case 0: return "1"
                case 1: return "2"
                case 2: return "3"
                case 3: return "4"
                case 4: return "5"
                default: return "0"
                    
                }
            }
        }
        else if progressBar == progressBarWithDifferentDimensions {
            if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "Picked"
                case 1: return "Loaded"
                case 2: return "Shipping"
                case 3: return "Receiving"
                default: return "Picked"
                    
                }
            }
            else if position == FlexibleSteppedProgressBarTextLocation.center {
                return "\(index)"
            }
            
            
        }
        return ""
    }
    

}

