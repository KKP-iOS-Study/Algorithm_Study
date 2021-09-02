//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/31.
//

// 참고 - https://kkk4872.tistory.com/129

let N = Int(readLine()!)!
let child = readLine()!.split(separator: " ").map{Int(String($0))!}

// 가장 긴 증가수열을 찾되 연속된 수를 가진 증가수열을 찾으면 문제를 해결

var idx = Array(repeating: 0, count: N)

for i in 0..<N {
    idx[child[i]-1] = i
}

var cnt = 1
var max = 0

for c in 0..<N-1 {
    
    if idx[c] < idx[c+1] {
        cnt += 1
        if cnt > max {
            max = cnt
        }
    } else {
        cnt = 1
    }
}

print(N-max)



