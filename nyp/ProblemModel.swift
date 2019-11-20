//
//  Problem.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 6/21/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.
//

import Foundation

class Problem {
    // The year the problem represents
    let year1: String
    let year2: String
    let year3: String
    let year4: String
    let yearFull: String
    // Rules model to apply restrictions to a problem
    let rules: RuleManager
    let rating: String
    // Expression handler/parser
    let expressionHandler: ExpressionModel
    // List of numbers that cannot be found
    let impossibles: Array<Int>
    // List of user-solved numbers in this problem
    var solved: Array<Int>
    
    init () {
        // TODO: Import file and read rules, year from file
        year1 = "1"
        year2 = "9"
        year3 = "4"
        year4 = "3"
        
        yearFull = year1 + year2 + year3 + year4 // temp and bad
        
        expressionHandler = ExpressionModel()
        impossibles = [] // temp
        solved = []
        
        rules = HardRuleManager()
        rating = "Hard"
    }
    
    init (year: Int, difficulty: String) {
        
        // assign year and sub-years (temp and bad)
        yearFull = String(year)
        let yearArray = Array(yearFull)
        year1 = String(yearArray[0])
        year2 = String(yearArray[1])
        year3 = String(yearArray[2])
        year4 = String(yearArray[3])
        
        // create new expression handler
        expressionHandler = ExpressionModel()
        
        // assign rules manager
        switch difficulty.lowercased() {
        case "h":
            rules = HardRuleManager()
            rating = "Hard"
        case "m":
            rules = MediumRuleManager()
            rating = "Medium"
        case "e":
            rules = EasyRuleManager()
            rating = "Easy"
        default:
            print("Invalid RuleManager string passed, default to medium")
            rules = MediumRuleManager()
            rating = "Medium"
        }
        
        // assign impossibles/solved (temp)
        impossibles = []
        solved = []
    }
    
    func getRating () -> String {
        return rating
    }
    
    func getPercent () -> String {
        // TODO: Incomplete implementation
        return "0"
    }
    
    func applyInitialRules (gvc: GameViewController) {
        rules.applyInitial(gvc: gvc)
    }
    
    func buttonTapResponse(gvc: GameViewController, buttonTapped: String) {
        // Takes character of button tapped and sends expression value back to GameViewController
        // Switch on year digit passed, unless operator
        rules.applyButtonRules(gvc: gvc, buttonChar: buttonTapped)
        let exprChar: String
        switch buttonTapped {
        case "1":
            exprChar = year1
        case "2":
            exprChar = year2
        case "3":
            exprChar = year3
        case "4":
            exprChar = year4
        default:
            exprChar = buttonTapped
        }
        // Pass character to expression handler
        expressionHandler.updateExpression(char: exprChar)
        // Return current expression
        gvc.setExpressionLabel(text: expressionHandler.getExpression())
        // Evaluate expression and set label based on validity
        if let value = expressionHandler.evaluate() {
            gvc.setAnswerLabel(text: String(value))
        } else {
            gvc.setAnswerLabel(text: gvc.unknownExprString)
        }
    }
    
    func clearedExpression (gvc: GameViewController) {
        // reset the expression model
        expressionHandler.clearExpression()
        // reset the expression and answer label
        gvc.setExpressionLabel(text: expressionHandler.getExpression())
        gvc.setAnswerLabel(text: gvc.unknownExprString)
        // apply rules for this action
        rules.applyButtonRules(gvc: gvc, buttonChar: "clear")
    }
    
    func submittedExpression(gvc: GameViewController) {
        // Check unwrap
        if let value = expressionHandler.evaluate() {
            // Check bounds
            if value <= 100 && value >= 1 {
                // List this value as solved
                solved.append(value)
                // Update GVC parameters to dsiplayed that it is solved
                gvc.changeToSolved(labelInt: value)
            } else if value > 100 {
                gvc.setExpressionLabel(text: gvc.tooBigMessage)
            } else {
                gvc.setExpressionLabel(text: gvc.tooSmallMessage)
            }
        } else { // Expression is invalid
            gvc.setExpressionLabel(text: gvc.invalidExpressionMessage)
        }
        // Apply rules for this action
        rules.applyButtonRules(gvc: gvc, buttonChar: "submit")
        // Reset the expressionHandler
        expressionHandler.clearExpression()
        // Reset the answer label
        gvc.clearAnswerLabel()
    }
}
