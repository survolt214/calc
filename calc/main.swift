//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
/*
 // Instead of using hardcoded "+", how can you represent it with an enum?
 Enum Operator {
    Addition
 }
 
 Operator.Addition
 */
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
//print(Int(args[0])!)

var split = args.split(separator: " ")
print(split[0])

var times: Int = args.count
var opsLevel = [Int](repeating: 0, count: times)
var newNum = [Int](repeating: 0, count: times)
var ops = [String]()

var i = 0
var j = 0
for i in 0...(times-1) {
    if (args[i] == "*") || (args[i] == "/") || (args[i] == "%") {
        ops[j] = args[i]
    }
    if (args[i] != "+") && (args[i] != "-") && (args[i] != "*") && (args[i] != "/") && (args[i] != "%") {
        newNum[i] = Int(args[i])!
        print(newNum[i])
    }
}

var result = 0
func calculate(mark: String, numLeft: Int, numRight: Int) {
    switch (mark) {
    case "+":
        result = numLeft + numRight
    case "-":
        result = numLeft - numRight
    case "*":
        result = numLeft * numRight
    case "/":
        if numRight == 0 {
            print("x / 0 dose not make sense")
            exit(2)
        }
        else{
            result = numLeft / numRight
        }
    case "%":
        result = numLeft % numRight
    default:
        print("input error marks")
        exit(3)
    }
}

if (args.count <= 3) {   //calculate if only 3 elements here.
    calculate(mark: args[1], numLeft: newNum[0], numRight: newNum[2])
   /* print(newNum[0])
      print(args[1])
    print(newNum[2])*/
    print(result)
    exit(0)
}




/*
var num1:Int = Int(split[0])!
var mark1 = String(split[1])
var num2:Int = Int(split[2])!

var num3 = 0
var mark2 = ""

if (split.count > 4){
    mark2 = String(split[3])
    num3 = Int(split[4])!
    calcLevel = 1
}
if mark2 == "*" {
    calcLevel = 2
}
if mark2 == "/"{
    calcLevel = 2
}
 
 
 func calculate(mark: String, newNum1: Int, newNum2: Int) {
 switch (mark) {
 case "+":
 result = newNum1 + newNum2
 case "-":
 result = newNum1 - newNum2
 case "*":
 result = newNum1 * newNum2
 case "/":
 if newNum2 == 0 {
 print("x / 0 dose not make sense")
 exit(2)
 }
 else{
 result = newNum1 / newNum2
 }
 case "%":
 result = newNum1 % newNum2
 default:
 print("input error marks")
 exit(3)
 }
 }
 
 switch (calcLevel){
 case 0:
 calculate(mark: mark1, newNum1: num1, newNum2: num2)
 print(result)
 
 case 1:
 calculate(mark: mark1, newNum1: num1, newNum2: num2)
 calculate(mark: mark2, newNum1: result, newNum2: num3)
 print(result)
 
 case 2:
 calculate(mark: mark2, newNum1: num2, newNum2: num3)
 calculate(mark: mark1, newNum1: num1, newNum2: result)
 print(result)
 default:
 exit(4)
 }
 
 
 exit(0)
*/
