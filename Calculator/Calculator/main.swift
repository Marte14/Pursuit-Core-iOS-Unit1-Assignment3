//
//  main.swift
//  Calculator
//
//  Created by katty y marte on 10/29/18.
//  Copyright © 2018 katty y marte. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}
//
//func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//
//}

func myMap (inputArray: [Int], closure: (Int) -> Int) -> [Int] {
    var output = [Int]()
    for number in inputArray {
        output.append(closure(number))
    }
    return output
}

func customReduce(){}


var tryAgain = true
outerloop : while tryAgain == true{
    print   ("""
            
            Wonky Calculator.

            opt 1 can:
            +, *, -, or / two numbers.
            
            option 2 can:
                1.compare numbers by larger or smaller than another
                2.multiply or divide several numbers by a another,
                3.add the total of a group of numbers.

            choose 1. Simple Operations Calculator or 2. Higher Functions Calculator
        """)
    var calculatorOn = true
    let arrayOperators = ["+","-","*","/","?",">","<","&"]
    
    while calculatorOn {
        
        guard let userInput = readLine() else{continue}
        switch userInput{
        case "1": //operations
            print("""
                        please enter a simple operation
                  """)
            guard let userInput = readLine() else {continue}
            var arrayOfStrings = userInput.components(separatedBy: " ")
            guard arrayOfStrings.count == 3 else {print("please only enter 2 valid numerical values and an operator separated b spaces");continue}
            guard let double1 = Double(arrayOfStrings[0]) else  {print("please enter 2 valid numerical values");continue}
            guard let double2 =  Double(arrayOfStrings[2]) else {print("please enter 2 valid numerical values");continue}
            
            switch arrayOfStrings[1] {
            case "+":
                let operationResult = mathStuffFactory(opString: "+")(double1, double2)
                print("\(userInput)" + "=" + " \(operationResult)")
            case "-":
                let operationResult = mathStuffFactory(opString: "-")(double1, double2)
                print("\(userInput)" + "=" + " \(operationResult)")
            case "*":
                let operationResult = mathStuffFactory(opString: "*")(double1, double2)
                print("\(userInput)" + "=" + " \(operationResult)")
            case "/":
                let operationResult = mathStuffFactory(opString: "/")(double1, double2)
                print("\(userInput)" + "=" + " \(operationResult)")
            case "?":
                let randomNum = Int.random(in : 0...3)
                var randomOperator = ""
                switch randomNum {
                case 0 :
                    randomOperator = "+"
                    
                case 1 :
                    randomOperator = "-"
                    
                case 2 :
                    randomOperator = "*"
                    
                case 3 :
                    randomOperator = "/"
                    
                default :
                    print("you are not too good at math")
                }
                
                guard let userInput = readLine() else {continue}
                let operationResult = mathStuffFactory(opString: randomOperator)(double1, double2)
                print(operationResult)
                print("please guess the operator")
                guard let userGuessedInput = readLine() else {continue}
                
                if userGuessedInput == randomOperator {
                    print("Correct!")
                }else {
                    print("wrong answer!")
                }
                
                
            default:
                print("Choose 1. simple calculations , 2. higher order operations")
            }
            
        case "2":
            print("""
                   
                    1.Filter : enter the operation name (filter, reduce or map), then enter numbers without spaces, enter the word by, enter a an "<" or ">", finally, a number to compare by. e.g "filter.
                    2.Map : multiply or divide several numbers by itself.  enter many numbers and an operator.
                    3.Reduce : sum or subtract a group of numbers.

                  """)
            
            //            filter 1,5,2,7,3,4 by < 4
            guard let userInput = readLine() else {continue}
            let arrayOfStrings = userInput.components(separatedBy: " ")//add a differentiating name to my arrasy in each case?..or is this good practice
            print(arrayOfStrings)
            guard arrayOfStrings.count == 5 else {print("format e.g. : filter 13456723 by < 4 ");continue}
            
            switch arrayOfStrings[0].lowercased(){
                
            case"Filter" :
                let numberStillStrings = arrayOfStrings[1].components(separatedBy: ",")
                var arrayInts = [Int]()
                for number in numberStillStrings{
                    if let num =  Int(number){
                        arrayInts.append(num)
                    }
                }
                let signAsAString = arrayOfStrings[3]
                var greaterOrSmallerSign = [Int]()
                for sign in arrayOfStrings{
                    if let sign  = Int(sign){
                        greaterOrSmallerSign.append(sign)
                    }
                }
                guard arrayOfStrings.count > 2 else {print("please enter numbers to compare by larger or smaller");continue }
                //  guard let  =  (arrayInts.count) else {print("please enter numbers");continue}
                
                //case "Reduce":
                // separete into componets count is good  make guards for the cases
                
                //let arrayOfStrings
                
                // case "Map" :
                // guard let
                //make sure they can be turned into ints and append
                
                print(myMap (inputArray: arrayInts) { (num: Int) -> Int in
                    return num + 1
                })
                print(myMap(inputArray: [1,2,3]) {$0 + 1})
                
                
            default:
                print("enter a correct operation")
                
            }
            
            
        default:
            print("more calculations?.. pick simple or higher order ops1")
            
        }
        tryAgain = false
        
    }
    
    
}




//guard let double2 =  Double(arrayOfStrings[2]) else {print("please enter 2 valid numerical values");continue}

//                guard let guessedOperator = String(arrayOfStrings[1]) else {print("please enter a valid comparisson operator")}
//            default:
//                print("enter a correct operation")
//            }
//




