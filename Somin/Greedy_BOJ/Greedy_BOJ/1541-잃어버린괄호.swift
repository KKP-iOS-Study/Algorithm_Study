//
//  1541-잃어버린괄호.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/20.
//

import Foundation

var input = readLine()!.split(separator: "-")
var plusNum = 0
var minusNum = 0

var plusArray = input[0].split(separator: "+")
for i in plusArray {
    plusNum += Int(String(i))!
}
for i in 1..<input.count {
    let temp = input[i].split(separator:"+")
    for j in temp {
        minusNum += Int(String(j))!
    }
}
print(plusNum - minusNum)
