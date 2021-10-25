//
//  1744-수묶기.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/20.
//

import Foundation

let N = Int(readLine()!)!
var multipleArray = [Int]()
var minusArray = [Int]()
var temp = 0
var answer = 0
var zeroFlag = false
func multiple (_array: [Int] ,zero Flag: Bool) -> Int {
    var ret = 0
    var temp = 0
    for i in 0..<_array.count {
        if i % 2 == 0 {
            temp = _array[i]
        }else {
            ret += temp * _array[i]
            temp = 0
        }
    }
    if temp > 0 || (temp < 0 && !Flag) {
        ret += temp
    }
    return ret
}

for _ in 0..<N {
    temp = Int(readLine()!)!
    if temp > 1 {
        multipleArray.append(temp)
    } else if temp < 0 {
        minusArray.append(temp)
    } else if temp == 0 {
        zeroFlag = true
    } else {
        answer += temp
    }
}
multipleArray.sort(by: > )
minusArray.sort()
answer += multiple(_array : multipleArray, zero: zeroFlag)
answer += multiple(_array : minusArray, zero: zeroFlag)

print(answer)
