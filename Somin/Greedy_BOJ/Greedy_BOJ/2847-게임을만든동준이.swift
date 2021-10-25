//
//  2847-게임을만든동준이.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/20.
//

import Foundation

let N = Int(readLine()!)!
var levelArray = [Int]()
var answer = 0

for _ in 0..<N {
    levelArray.append(Int(readLine()!)!)
}
levelArray.reverse()
for i in 0..<(N - 1) {
    if levelArray[i] <= levelArray[i + 1] {
        answer += levelArray[i + 1] - levelArray[i] + 1
        levelArray[i + 1] = levelArray[i] - 1
    }
}
print(answer)
