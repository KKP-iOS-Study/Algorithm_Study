//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/14.
//

var n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: n+1)

for i in 0...n {
    if i < 2 {continue} // i = 0, 1 -> 0
    
    dp[i] = dp[i-1] + 1
    
    if i%3==0 && dp[i] > dp[i/3]+1 {
        dp[i] = dp[i/3]+1
    }
    
    if i%2==0 && dp[i] > dp[i/2]+1 {
        dp[i] = dp[i/2]+1
    }
}

print(dp[n])
