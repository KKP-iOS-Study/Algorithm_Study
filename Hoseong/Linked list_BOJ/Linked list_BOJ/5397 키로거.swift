//
//  main.swift
//  Linked list_BOJ
//
//  Created by 강호성 on 2021/07/28.
//

var left = [Character]()
var right = [Character]()

for _ in 0..<Int(readLine()!)! {
    let command = Array(readLine()!)

    for input in command {
        
        if input == "<" {
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        } else if input == ">" {
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        } else if input == "-" {
            if !left.isEmpty {
                left.removeLast()
            }
        } else {
            left.append(input)
        }
    }
    print((left+right.reversed()).map{String($0)}.joined())
    left = []
    right = []
}

