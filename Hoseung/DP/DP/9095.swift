//
/*
DP 1,2,3 더하기 9095.swift
Created by: hoseung Lee on 2021/10/14
https://www.acmicpc.net/problem/9095
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/
func boj9053() {
  
  let inputCase = Int(readLine()!)!
  var dp: [Int] = .init(repeating: 0, count: 12)
  dp[1] = 1
  dp[2] = 2
  dp[3] = 4
  
  for i in 4...10 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
  }
  
  for _ in 1...inputCase {
    print(dp[Int(readLine()!)!])
  }
}
