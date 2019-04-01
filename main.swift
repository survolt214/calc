//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//



//var args = ProcessInfo.processInfo.arguments
//args.removeFirst() // remove the name of the program
//print(Int(args[0])!)*/
import Foundation

print("Please enter positive integer with space (e.g.:1 + 1 * 3): ")  //, terminator: ""
let input = String(readLine()!)
let inputNum = input
var result: Int = 0
var calcLevel = 0
//let inputNum = input.trimmingCharacters(in: .whitespaces)
var split = inputNum.split(separator: " ")
//print(split[0])
if (split.count < 3) {
    print("please check input correct numbers with space")
    exit(1)
    
}
let num1:Int = Int(split[0])!
let mark1 = String(split[1])
let num2:Int = Int(split[2])!

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
