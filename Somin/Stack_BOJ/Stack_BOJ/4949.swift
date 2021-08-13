//
//  4949.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/12.

import Foundation

while true {
    var input = readLine()!
    var inputArray = [Character]()
    var flag = true
    if input == "." {
        break
    }
    for i in Array(input){
        if i == "(" || i == "[" {
            inputArray.append(i)
        }else if i == ")" {
            if inputArray.count == 0 || inputArray.removeLast() != "(" {
                flag = false
                break
            }
        }else if i == "]" {
            if inputArray.count == 0 || inputArray.removeLast() != "[" {
                flag = false
                break
            }
        }
    }
    if !flag || inputArray.count != 0 {
        print("no")
    }else {
        print("yes")
    }
}
