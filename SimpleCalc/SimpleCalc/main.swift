//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    
    private func findOp(_ args: [String]) -> String? {
        var oper : String?
        for arg in args {
            if Int(arg) == nil {
                oper = arg
                break
            }
        }
        return oper
    }
    
    public func calculate(_ args: [String]) -> Int {
        let oper = findOp(args)
        let count: Int = args.count - 1
        let operation = (oper, count)
        let value: Int
        switch operation {
        case ("+"?, _):
            value = Int(args[0])! + Int(args[2])!
        case ("-"?, _):
            value = Int(args[0])! - Int(args[2])!
        case ("*"?, _):
            value = Int(args[0])! * Int(args[2])!
        case ("/"?, _):
            value = Int(args[0])! / Int(args[2])!
        case ("%"?, _):
            value = Int(args[0])! % Int(args[2])!
        case (_, 0):
            value = 0
        case ("count"?, _):
            value = count
        case ("avg"?, _):
            var num: Int = 0
            for i in 0..<count {
                num += Int(args[i])!
            }
            value = num / (count)
        case ("fact"?, _):
            let number: Int = Int(args[0])!
            var fact: Int = 1
            let n: Int = number + 1
            for i in 1..<n{
                fact *= i
            }
            value = fact;
        default:
            value = 0
        }
        return value
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

