//
/*
DP 파도반 수열 9461.swift
Created by: hoseung Lee on 2021/10/21
https://www.acmicpc.net/problem/9461
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj9461() {
  
  var dp: [Int] = .init(repeating: 0, count: 101)
  dp[1...4] = [1,1,1,2]
  for index in 5...100 {
    dp[index] = (index - 5 >= 0 ? dp[index - 5] : 0) + dp[index - 1]
  }
  
  for _ in 1...Int(readLine()!)! {
    print(dp[Int(readLine()!)!])
  }
}


