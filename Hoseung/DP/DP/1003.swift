//
/*
DP 피보나치 함수 1003.swift
Created by: hoseung Lee on 2021/10/19
https://www.acmicpc.net/problem/1003
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

//점화식
/*
 //dp2 == dp 1, dp 0 (1, 1)
 //dp3 == dp 2, dp 1 (1, 2)
 //dpX == (dpX-2[0] + dpX-1[0], dpX-2[1] + dpX-1[1])
 */

func boj1003() {
  let testCase = Int(readLine()!)!
  
  var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: 2), count: 41)
  
  dp[0][0] = 1
  dp[0][1] = 0
  dp[1][0] = 0
  dp[1][1] = 1
  
  for index in 2...40 {
    dp[index][0] = dp[index - 2][0] + dp[index - 1][0]
    dp[index][1] = dp[index - 2][1] + dp[index - 1][1]
  }
  
  for _ in 1...testCase {
    let targetNumber = Int(readLine()!)!
    
    print(dp[targetNumber][0], dp[targetNumber][1])
  }
}
