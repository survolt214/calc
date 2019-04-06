//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()
var split = args.split(separator: " ")              //input

var times: Int = args.count
var result = 0                                      //reset result
var newNum = [Int](repeating: 0, count: times)      //number array
var ops = [String](repeating: "", count: times)     //ops array

var i = 0                                           //loop count
var j = 0                                           //count of ops
var k = 0                                           //count of numbers
for i in 0...(times-1) {
    if (args[i] == "+") || (args[i] == "-") || (args[i] == "*") || (args[i] == "/") || (args[i] == "%") || (args[i] == "x") {
        ops[j] = args[i]                            //ops array
        j = j + 1
    }
    else {                                          //number array
        newNum[k] = Int(args[i])!
        k = k + 1
    }
}


func checkError() {
    if (k - j) > 1 {                                //if there are two or more numbers than ops, it is error
        print("too much number")
        exit(5)
    }
    if (k - j) < 1 {                                //if there are equal or less numbers than ops, it is error
        print("too much ops")
        exit(5)
    }
    
}
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
            print("you can not devide 0")
            exit(2)
        }
        else{
            result = numLeft / numRight
        }
    case "%":
        result = numLeft % numRight
    case "x":
        result = numLeft * numRight
    default:
        print("input error")
        exit(3)
    
    }
}
if (args.count == 1) {                                                                    //display when only one number
    checkError()
    result = Int(args[0])!
    print(result)
}

if (args.count == 2) {                                                                    //always error
    checkError()
}

if (args.count == 3) {                                                                    //calculate if only 3 elements here.（1+2）
    checkError()
    calculate(mark: args[1], numLeft: newNum[0], numRight: newNum[1])
    print(result)
    
}

if (args.count > 3) {                                                                     //calculate if more than 3 elements here.
    checkError()
    for j in 0...(((times-1)/2)-1) {
        if (ops[j] == "*") || (ops[j] == "/") || (ops[j] == "%") || (ops[j] == "x") {     //calculate "*""/""%" first
            calculate(mark: ops[j], numLeft: newNum[j], numRight: newNum[j+1])
            if (j == 0) {                                                                 //if the fisrt ops is "*","/" or "%"
                newNum[0] = 0
                newNum[1] = result
                ops[j] = "+"
            }
            else {                                                                        //delete numLeft and used ops, make numRight = result
            newNum[j] = 0                                                                 //(5 * 7) = (0 + result)
            newNum[j+1] = result
            ops[j] = ops[j-1]
            }
        }
    }
    for j in 0...(((times-1)/2)-1) {
        calculate(mark: ops[j], numLeft: newNum[j], numRight: newNum[j+1])
        if (j == 0) {                                                                     //if the first ops is "+""-"
            newNum[0] = 0
            newNum[1] = result
            ops[j] = "+"
        }
        else {
        newNum[j] = 0
        newNum[j+1] = result
        ops[j] = "ops[j-1]"
        }
    }
    print(result)
    exit(0)
}

