//
//  2217-로프.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/16.
//

import Foundation

let N = Int(readLine()!)!
var ropeArray = [Int]()
for _ in 0..<N {
    ropeArray.append(Int(readLine()!)!)
}
ropeArray.sort(by: > )

var maxValue = 0
for i in 1...ropeArray.count {
    maxValue = max(maxValue, ropeArray[i - 1] * i)
}
print(maxValue)
