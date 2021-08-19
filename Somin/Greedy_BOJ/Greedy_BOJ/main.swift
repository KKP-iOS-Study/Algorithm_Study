//
//  main.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/14.
//

import Foundation

var input = Array(readLine()!)
var plusNum = 0
var minusNum = 0
var temp = 0
var i = 0
var minusflag = false
let length = input.count
while (input[i] != "-" && input[i] != "+")
{
    temp = Int(String(input[i]))! + (10 * temp)
    i += 1
}
plusNum += temp
while i < length {
    temp = 0
    if input[i] == "-" {
        minusflag = true
        i += 1
    }else if input[i] == "+" {
        i += 1
    }
    if (i == length) {break}
    while (input[i] != "-" && input[i] != "+") {
        temp = Int(String(input[i]))! + (10 * temp)
        i += 1
        if (i == length) {break}
    }
    if (minusflag) {
        minusNum += temp
    } else {
        plusNum += temp
    }
}
print(plusNum - minusNum)
