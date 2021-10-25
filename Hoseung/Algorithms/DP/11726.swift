//
/*
DP 2xn 타일링 11726.swift
Created by: hoseung Lee on 2021/10/15
https://www.acmicpc.net/problem/11659
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

//2는 신경 쓸 필요 없는, 피보나치 수열 구하는 문제
func boj11726() {
  let n = Int(readLine()!)!
  guard n > 3 else { print(n); return }
  var dp: [Int] = .init(repeating: 0, count: 1002)
  dp[0] = 0
  dp[1] = 1
  dp[2] = 2
  dp[3] = 3
  for index in 4...n {
    dp[index] = (dp[index - 1] + dp[index - 2]) % 10_007
  }
  print(dp[n])
}
