//
//  11399-ATM.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/16.
//

import Foundation

let N = Int(readLine()!)!
var list = readLine()!.split(separator: " " ).map{Int($0)!}

list.sort()
var answer = 0
for i in 0..<list.count {
    answer += list[i] * (list.count - i)
}
print(answer)
