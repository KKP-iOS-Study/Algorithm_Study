//
//  1931-회의실배정.swift
//  Greedy_BOJ
//
//  Created by 박소민 on 2021/08/16.
//

import Foundation

let N = Int(readLine()!)!
var meetingArray = [(Int, Int)]()
for _ in 0..<N {
    let temp = readLine()!.split(separator:" ").map{Int($0)!}
    meetingArray.append((temp[0], temp[1]))
}
meetingArray.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }else {
        return $0.1 < $1.1
    }
}

var answer = 0
var tmp = 0
for i in meetingArray {
    if i.0 >= tmp {
        answer += 1
        tmp = i.1
    }
}
print(answer)
