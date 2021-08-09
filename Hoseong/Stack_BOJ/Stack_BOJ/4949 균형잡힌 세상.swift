//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/09.
//


while true {
    
    let str = readLine()!
    var stack = [Character]()
    
    if str == "." { break }
    
    for s in str {
        
        if s == "(" || s == "[" {
            stack.append(s)
        } else if s == ")" {
            
            if !stack.isEmpty && stack.last! == "(" {
                stack.removeLast()
            } else {
                stack.append(")")
                break
            }
            
            
        } else if s == "]" {
            
            if !stack.isEmpty && stack.last! == "[" {
                stack.removeLast()
            } else {
                stack.append("]")
                break
            }
        }
    }
    
    if stack.isEmpty { print("yes") } else { print("no") }
}
