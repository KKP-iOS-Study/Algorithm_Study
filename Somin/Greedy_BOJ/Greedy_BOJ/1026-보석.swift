//
//  1026-보석.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/16.
//

import Foundation

let N = Int(readLine()!)!
var aArray = readLine()!.split(separator: " ").map{Int($0)!}
var bArray = readLine()!.split(separator: " ").map{Int($0)!}
var answer = 0
for _ in 0..<aArray.count {
    answer += aArray.remove(at: aArray.firstIndex(of: aArray.min()!)!) * bArray.remove(at: bArray.firstIndex(of: bArray.max()!)!)
}
print(answer)
