//
//  10828.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/06.
//

import Foundation

let N = Int(readLine()!)!
var answerArray = [Int]()

for _ in 0..<N{
    var input = readLine()!.split(separator: " ")
    if input[0] == "push" {
        answerArray.append(Int(input[1])!)
    }
    else if input[0] == "top"{
        if (answerArray.count == 0){
            print("-1")
        } else {
            print(answerArray[answerArray.count - 1])
        }
    }
    else if input[0] == "pop"{
        if (answerArray.count == 0){
            print("-1")
        } else {
            print(answerArray.removeLast())
        }
    }
    else if input[0] == "size"{
        print(answerArray.count)
    }
    else if input[0] == "empty"{
        if (answerArray.count == 0){
            print("1")
        } else {
            print("0")
        }
    }
}
