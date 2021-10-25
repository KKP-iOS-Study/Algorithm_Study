//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/24.
//

let n = Int(String(readLine()!))!
var input = [[Int]]()

for _ in 0..<n { input.append(readLine()!.split(separator: " ").map({Int(String($0))!})) }

var next = [Int](repeating: 0, count: n+1)
for i in 0..<n { next[i] = i + input[i][0] } // 다음 상담 날짜
print(next)
var dp = [Int](repeating: 0, count: n+1)
for i in 0..<n {
    
    if next[i] > n { continue } // 총 일수 n보다 크면 제외

    for j in next[i]...n {
        dp[j] = max(dp[j], dp[i] + input[i][1])
    }
}

print(dp.max()!)
