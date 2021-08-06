//
//  10773.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/06.
//

import Foundation

let N = Int(readLine()!)!
var answerArray = [Int]()

for _ in 0..<N{
    let input = Int(readLine()!)!
    if input == 0 {
        answerArray.removeLast()
    }else {
        answerArray.append(input)
    }
}
print(answerArray.reduce(0, +))
