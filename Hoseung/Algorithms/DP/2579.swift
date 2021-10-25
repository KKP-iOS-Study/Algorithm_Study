//
/*
DP 계단오르기 2579.swift
Created by: hoseung Lee on 2021/10/14
https://www.acmicpc.net/problem/2579
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj2579() {
  let stepSize = Int(readLine()!)!
  var steps: [Int] = [-1]
  for _ in 1...stepSize {
    steps.append(Int(readLine()!)!)
  }
  
  guard stepSize > 2 else {
    if stepSize == 1 { print(steps[1])}
    if stepSize == 2 { print(steps[1] + steps[2])}
    return
  }
  
  var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: 3), count: 301)
  
  dp[1][1] = steps[1]
  dp[1][2] = 0
  dp[2][1] = steps[2]
  dp[2][2] = steps[1] + steps[2]
  
  for i in 3...stepSize {
    //점프해서 밟기
    dp[i][1] = max(dp[i - 2][1], dp[i - 2][2]) + steps[i]
    
    //연달아서 밟기
    dp[i][2] = dp[i - 1][1] + steps[i]
  }
  
  print(max(dp[stepSize][1], dp[stepSize][2]))
  
}
