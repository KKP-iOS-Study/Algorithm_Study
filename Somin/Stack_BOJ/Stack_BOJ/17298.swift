//
//  17298.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/11.
//

import Foundation

let N = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map({Int(String($0))!})
var answerArray = [Int]()
var tempArray = [Int]()

for i in 1...N {
    while !tempArray.isEmpty && input[N - i] >= tempArray.last! {
        tempArray.removeLast()
    }
    if tempArray.isEmpty {
        answerArray.append(-1)
    }else {
        answerArray.append(tempArray.last!)
    }
    tempArray.append(input[N - i])
}
print(answerArray.reversed().map({String($0)}).joined(saparator: " "))

