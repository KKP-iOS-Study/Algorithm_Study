//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/25.
//


let N = readLine()!
var num = Array(repeating: 0, count: 10)

for i in N {
    
    if i == "9" {
        num[6] += 1
    } else {
        num[Int(String(i))!] += 1
    }
}

num[6] = num[6] % 2 == 0 ? num[6] / 2 : num[6] / 2 + 1

print(num.max()!)

