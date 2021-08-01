//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/01.
//


var stack = [Int]()
var pop = [Int]()

for _ in 0..<Int(readLine()!)! {
    
    let command = readLine()!.split(separator: " ").map{String($0)}
    
    if command[0] == "top" {
        stack.isEmpty ? print("-1") : print(stack.last!)
    } else if command[0] == "empty" {
        stack.isEmpty ? print("1") : print("0")
    } else if command[0] == "size" {
        print(stack.count)
    } else if command[0] == "pop" {
        if !stack.isEmpty {
            pop.append(stack.removeLast())
            print(pop.last!)
        } else {
            print("-1")
        }
    } else if command[0] == "push" {
        stack.append(Int(command[1])!)
    }
}

