//
//  RulesManagerModel.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 6/28/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.

/*
 Rules configurations:
    Easy: Use each number once, any order
    Medium: Use each number once, in order
    Hard: Use each number once, in order, must use all four
 Other Ideas:
    Crazyhouse: Each use enables another number at random
    Reverse: Medium, but in reverse order
*/

import Foundation

class RuleManager {
    // Manager to implement the input restrictions
    
    // Determines which events are actionable
    let actionables = ["1", "2", "3", "4"]
    let resets = ["submit", "clear"]
    
    // Called from external to pass buttons as tapped, filters to buttonRules()
    // to pass only rule-actionable calls
    func applyButtonRules (gvc: GameViewController, buttonChar: String) {
        if actionables.contains(buttonChar) {
            // Pass down to buttonRules()
            buttonRules(gvc: gvc, button: buttonChar)
        } else if resets.contains(buttonChar) {
            applyInitial(gvc: gvc)
        }
    }
    
    func buttonRules (gvc: GameViewController, button: String) {
        // Override in subclasses for different rules
        print("RuleManager: buttonRules: Incomplete method to be overriden in subclass")
    }
    
    func applyInitial(gvc: GameViewController) {
        // Override in subclasses for different initial conditions
        print("RuleManager: applyInitial: Incomplete method to be overriden in subclass")
    }
}


class EasyRuleManager: RuleManager {
    // Subclass to define the rules of the easy mode of the game (use at most once, any order)
    // Uses super.init() and super.applyButtonRules()
    
    override func buttonRules(gvc: GameViewController, button: String) {
        // Applies medium rules (one use, any order)
        gvc.disableButton(button: button)
    }
    
    override func applyInitial(gvc: GameViewController) {
        // Apply initial restrictions for medium mode (none)
        // Re-enable all buttons
        gvc.enableAllButtons()
    }
}



class MediumRuleManager: RuleManager {
    // Subclass to define the rules of the medium mode of the game (use at most once, in order)
    // Uses super.init() and super.applyButtonRules()
    
    override func buttonRules (gvc: GameViewController, button: String) {
        // Apply hard mode rules (single use, in order)
        // Disable current button
        gvc.disableButton(button: button)
        if button != "4" {
            // Enable next button
            gvc.enableButton(button: String(Int(button)! + 1))
        }
    }
    
    override func applyInitial(gvc: GameViewController) {
        // Start by enabling button 1, disable others
        gvc.enableButton(button: "1")
        gvc.disableButton(button: "2")
        gvc.disableButton(button: "3")
        gvc.disableButton(button: "4")
    }
}

class HardRuleManager: RuleManager {
    // Subclass to define the rules of the hard mode of the game (use exactly once, in order)
    // Uses super.init() and super.applyButtonRules()
    
    override func buttonRules (gvc: GameViewController, button: String) {
        // Apply hard mode rules (single use, in order)
        // Disable current button
        gvc.disableButton(button: button)
        if button != "4" {
            // Enable next button
            gvc.enableButton(button: String(Int(button)! + 1))
        } else { // if button == 4
            gvc.enableButton(button: "submit")
        }
    }
    
    override func applyInitial(gvc: GameViewController) {
        // Start by enabling button 1, disable others
        gvc.enableButton(button: "1")
        gvc.disableButton(button: "2")
        gvc.disableButton(button: "3")
        gvc.disableButton(button: "4")
        gvc.disableButton(button: "submit")
    }
}
