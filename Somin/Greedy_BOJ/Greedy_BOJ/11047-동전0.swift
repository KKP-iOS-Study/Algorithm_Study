//
//  11047-동전0.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/16.
//

import Foundation

let N = readLine()!.split(separator: " ").map{Int($0)!}
var coinArray = [Int]()
for _ in 0..<N[0] {
    coinArray.append(Int(readLine()!)!)
}

var price = N[1]
var count = 0
for i in 0..<coinArray.count {
   count += price / coinArray [N[0] - 1 - i]
    price %= coinArray [N[0] - 1 - i]
}
print(count)
