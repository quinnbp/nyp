//
//  GameViewController.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 6/14/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.
//

// Document this better
// New button for clear expression

import UIKit

class GameViewController: UIViewController {
    
    //MARK: UI Properties
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var expressionDisplay: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var numOneButton: UIButton!
    @IBOutlet weak var numTwoButton: UIButton!
    @IBOutlet weak var numThreeButton: UIButton!
    @IBOutlet weak var numFourButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    // Num Labels (persist)
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    @IBOutlet weak var num4: UILabel!
    @IBOutlet weak var num5: UILabel!
    @IBOutlet weak var num6: UILabel!
    @IBOutlet weak var num7: UILabel!
    @IBOutlet weak var num8: UILabel!
    @IBOutlet weak var num9: UILabel!
    @IBOutlet weak var num10: UILabel!
    
    @IBOutlet weak var num11: UILabel!
    @IBOutlet weak var num12: UILabel!
    @IBOutlet weak var num13: UILabel!
    @IBOutlet weak var num14: UILabel!
    @IBOutlet weak var num15: UILabel!
    @IBOutlet weak var num16: UILabel!
    @IBOutlet weak var num17: UILabel!
    @IBOutlet weak var num18: UILabel!
    @IBOutlet weak var num19: UILabel!
    @IBOutlet weak var num20: UILabel!
    
    @IBOutlet weak var num21: UILabel!
    @IBOutlet weak var num22: UILabel!
    @IBOutlet weak var num23: UILabel!
    @IBOutlet weak var num24: UILabel!
    @IBOutlet weak var num25: UILabel!
    @IBOutlet weak var num26: UILabel!
    @IBOutlet weak var num27: UILabel!
    @IBOutlet weak var num28: UILabel!
    @IBOutlet weak var num29: UILabel!
    @IBOutlet weak var num30: UILabel!
    
    @IBOutlet weak var num31: UILabel!
    @IBOutlet weak var num32: UILabel!
    @IBOutlet weak var num33: UILabel!
    @IBOutlet weak var num34: UILabel!
    @IBOutlet weak var num35: UILabel!
    @IBOutlet weak var num36: UILabel!
    @IBOutlet weak var num37: UILabel!
    @IBOutlet weak var num38: UILabel!
    @IBOutlet weak var num39: UILabel!
    @IBOutlet weak var num40: UILabel!
    
    @IBOutlet weak var num41: UILabel!
    @IBOutlet weak var num42: UILabel!
    @IBOutlet weak var num43: UILabel!
    @IBOutlet weak var num44: UILabel!
    @IBOutlet weak var num45: UILabel!
    @IBOutlet weak var num46: UILabel!
    @IBOutlet weak var num47: UILabel!
    @IBOutlet weak var num48: UILabel!
    @IBOutlet weak var num49: UILabel!
    @IBOutlet weak var num50: UILabel!
    
    @IBOutlet weak var num51: UILabel!
    @IBOutlet weak var num52: UILabel!
    @IBOutlet weak var num53: UILabel!
    @IBOutlet weak var num54: UILabel!
    @IBOutlet weak var num55: UILabel!
    @IBOutlet weak var num56: UILabel!
    @IBOutlet weak var num57: UILabel!
    @IBOutlet weak var num58: UILabel!
    @IBOutlet weak var num59: UILabel!
    @IBOutlet weak var num60: UILabel!
    
    @IBOutlet weak var num61: UILabel!
    @IBOutlet weak var num62: UILabel!
    @IBOutlet weak var num63: UILabel!
    @IBOutlet weak var num64: UILabel!
    @IBOutlet weak var num65: UILabel!
    @IBOutlet weak var num66: UILabel!
    @IBOutlet weak var num67: UILabel!
    @IBOutlet weak var num68: UILabel!
    @IBOutlet weak var num69: UILabel!
    @IBOutlet weak var num70: UILabel!
    
    @IBOutlet weak var num71: UILabel!
    @IBOutlet weak var num72: UILabel!
    @IBOutlet weak var num73: UILabel!
    @IBOutlet weak var num74: UILabel!
    @IBOutlet weak var num75: UILabel!
    @IBOutlet weak var num76: UILabel!
    @IBOutlet weak var num77: UILabel!
    @IBOutlet weak var num78: UILabel!
    @IBOutlet weak var num79: UILabel!
    @IBOutlet weak var num80: UILabel!
    
    @IBOutlet weak var num81: UILabel!
    @IBOutlet weak var num82: UILabel!
    @IBOutlet weak var num83: UILabel!
    @IBOutlet weak var num84: UILabel!
    @IBOutlet weak var num85: UILabel!
    @IBOutlet weak var num86: UILabel!
    @IBOutlet weak var num87: UILabel!
    @IBOutlet weak var num88: UILabel!
    @IBOutlet weak var num89: UILabel!
    @IBOutlet weak var num90: UILabel!
    
    @IBOutlet weak var num91: UILabel!
    @IBOutlet weak var num92: UILabel!
    @IBOutlet weak var num93: UILabel!
    @IBOutlet weak var num94: UILabel!
    @IBOutlet weak var num95: UILabel!
    @IBOutlet weak var num96: UILabel!
    @IBOutlet weak var num97: UILabel!
    @IBOutlet weak var num98: UILabel!
    @IBOutlet weak var num99: UILabel!
    @IBOutlet weak var num100: UILabel!
    
    
    //MARK: Data properties
    // Problem is passed from segue from prior ViewController?
    var problemModel = Problem()
    // LabelDict is used to keep track of labels
    var labelDict = Dictionary<Int, UILabel>()
    
    // Message/notify strings
    let unknownExprString = "??" // Fills in answer label when unknown
    
    let tooBigMessage = "That value is too big!"
    let tooSmallMessage = "That value is too small!"
    let invalidExpressionMessage = "That expression is invalid! Oops!"
    let youGotMessage = "Nice! You got "
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLabelDict()
        assignParameters()
        problemModel.applyInitialRules(gvc: self)
    }
    
    func enableAllButtons() {
        numOneButton.isEnabled = true
        numTwoButton.isEnabled = true
        numThreeButton.isEnabled = true
        numFourButton.isEnabled = true
        submitButton.isEnabled = true
    }
    
    func disableButton(button: String) {
        // Switch case to disable year buttons individually
        switch button {
        case "1":
            numOneButton.isEnabled = false
        case "2":
            numTwoButton.isEnabled = false
        case "3":
            numThreeButton.isEnabled = false
        case "4":
            numFourButton.isEnabled = false
        case "submit":
            submitButton.isEnabled = false
        default:
            print("GVC : disableButton : No known button with character \(button).")
        }
    }
    
    func enableButton(button: String) {
        // Switch case to enable year buttons individually
        switch button {
        case "1":
            numOneButton.isEnabled = true
        case "2":
            numTwoButton.isEnabled = true
        case "3":
            numThreeButton.isEnabled = true
        case "4":
            numFourButton.isEnabled = true
        case "submit":
            submitButton.isEnabled = true
        default:
            print("GVC : enableButton : No known button with character \(button).")
        }
    }

    func assignParameters() {
        // Set button labels
        numOneButton.setTitle(problemModel.year1, for: .normal)
        numTwoButton.setTitle(problemModel.year2, for: .normal)
        numThreeButton.setTitle(problemModel.year3, for: .normal)
        numFourButton.setTitle(problemModel.year4, for: .normal)
        // Set year label
        yearLabel.text = problemModel.yearFull
    }
    
    // Builds dictionary for NumGrid labels
    func buildLabelDict() {
        labelDict = [1: num1, 2: num2, 3: num3, 4: num4, 5: num5, 6: num6, 7: num7, 8: num8, 9: num9, 10: num10, 11: num11, 12: num12, 13: num13, 14: num14, 15: num15, 16: num16, 17: num17, 18: num18, 19: num19, 20: num20, 21: num21, 22: num22, 23: num23, 24: num24, 25: num25, 26: num26, 27: num27, 28: num28, 29: num29, 30: num30, 31: num31, 32: num32, 33: num33, 34: num34, 35: num35, 36: num36, 37: num37, 38: num38, 39: num39, 40: num40, 41: num41, 42: num42, 43: num43, 44: num44, 45: num45, 46: num46, 47: num47, 48: num48, 49: num49, 50: num50, 51: num51, 52: num52, 53: num53, 54: num54, 55: num55, 56: num56, 57: num57, 58: num58, 59: num59, 60: num60, 61: num61, 62: num62, 63: num63, 64: num64, 65: num65, 66: num66, 67: num67, 68: num68, 69: num69, 70: num70, 71: num71, 72: num72, 73: num73, 74: num74, 75: num75, 76: num76, 77: num77, 78: num78, 79: num79, 80: num80, 81: num81, 82: num82, 83: num83, 84: num84, 85: num85, 86: num86, 87: num87, 88: num88, 89: num89, 90: num90, 91: num91, 92: num92, 93: num93, 94: num94, 95: num95, 96: num96, 97: num97, 98: num98, 99: num99, 100: num100]
    }
    
    // Mutator for the expression label
    func setExpressionLabel(text: String) {
        expressionDisplay.text = text
    }
    
    // Mutator for the answer label
    func setAnswerLabel(text: String) {
        answerLabel.text = " = " + text
    }
    
    func changeToSolved(labelInt: Int) {
        if let labelToChange = labelDict[labelInt] {
            labelToChange.textColor = UIColor.green
            setExpressionLabel(text: self.youGotMessage + String(labelInt) + "!")
        } else {
            print("changeToSolved passed unknown value")
        }
    }
    
    func clearAnswerLabel () {
        answerLabel.text = ""
    }
    
    //MARK: Actions
    
    // Behavior after submit button is tapped
    @IBAction func submitButtonTapped(_ sender: Any) {
        problemModel.submittedExpression(gvc: self)
    }
    
    // All buttons except for Submit have the same behavior,
    // each passing a different character to the model
    @IBAction func clearButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.clearedExpression(gvc: self)
    }
    
    @IBAction func numOneTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "1")
    }
    
    @IBAction func numTwoTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "2")
    }
    
    @IBAction func numThreeTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "3")
    }
    
    @IBAction func numFourTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "4")
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "+")
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "-")
    }
    
    @IBAction func timesButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "*")
    }
    
    @IBAction func divideButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "/")
    }
    
    @IBAction func expButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "**")
    }
    
    
    @IBAction func leftParenButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: "(")
    }
    
    
    @IBAction func rightParenButtonTapped(_ sender: Any) {
        // Tell problem model that button was tapped
        problemModel.buttonTapResponse(gvc: self, buttonTapped: ")")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
