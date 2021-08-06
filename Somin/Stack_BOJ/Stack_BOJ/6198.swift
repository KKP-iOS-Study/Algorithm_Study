//
//  6198.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/06.
//

import Foundation

let N = Int(readLine()!)!
var building = [Int]()
var maxNumber: Int
var count = 0

for _ in 0..<N {
    building.append(Int(readLine()!)!)
}
for i in 0..<building.count {
    maxNumber = building[i]
    for j in (i+1)..<building.count{
        if building[j] >= maxNumber {
            break;
        }
        count += 1
    }
}
print(count)
