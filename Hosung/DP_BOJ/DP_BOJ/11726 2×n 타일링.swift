//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/19.
//

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: n+1)

dp[1] = 1

if n > 1 {
    dp[2] = 2
}

if n > 2 {
    for i in 3...n {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
}

print(dp[n])
