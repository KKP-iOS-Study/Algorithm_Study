//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/14.
//

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 12)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4..<12 {
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
    }
    print(dp[n])
}
