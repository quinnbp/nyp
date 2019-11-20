//
//  ExpressionModel.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 6/17/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.
//

import Foundation
import MathParser

public class ExpressionModel {
    var currentExpression: String
    
    init () {
       currentExpression = ""
    }
    
    func getExpression () -> String {
        return currentExpression
    }
    
    func updateExpression(char: String) {
        // Add new character to current expression
        currentExpression += char
    }
    
    func clearExpression() {
        currentExpression = ""
    }
    
    func evaluate() -> Int? {
        // Wrapper for parseExpr
        let retVal: Int? = parseExpr(expr: self.currentExpression)
        return retVal
    }
    
    func parseExpr(expr: String) -> Int? {
        // This function will either return an integer calculated from the
        // user input expression, or a nil value
        let value: Double
        
        // Parse expression using MathParser module, return nil on catch
        do {
            value = try expr.evaluate()
        } catch {
            return nil
        }
        
        // Check to make sure output is integer, else return nil
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            // Cast to Int and return
            return Int(value)
        } else {
            // If we ended up with a fraction, return nil
            return nil
        }
    }
}
