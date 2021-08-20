//
//  1439-뒤집기.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/20.
//

import Foundation

let inputArray = Array(readLine()!)
var countZero = 0
var countOne = 0
var beforeNum = inputArray.first!
if beforeNum == "0" {
    countOne += 1
} else {
    countZero += 1
}
for i in inputArray {
    if i != beforeNum {
        if i == "0" {
            countOne += 1
        } else {
            countZero += 1
        }
    }
    beforeNum = i
}
print(min(countZero, countOne))
