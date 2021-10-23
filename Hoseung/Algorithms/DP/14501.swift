//
/*
DP 퇴사 14501.swift
Created by: hoseung Lee on 2021/10/21
https://www.acmicpc.net/problem/14501
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/


func boj14501() {
  
  let n = Int(readLine()!)!
  var schedule: [[Int]] = .init(repeating: .init(repeating: 0, count: 2), count: 20)
  for index in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    schedule[index][0] = input[0]
    schedule[index][1] = input[1]
  }
  
  var dp: [Int] = .init(repeating: 0, count: 20)
  for i in 0..<n {
    dp[i] = max(dp[i], i > 0 ? dp[i - 1] : 0)
    
    if i + schedule[i][0] <= n + 1 {
      dp[i + schedule[i][0]] = max(dp[i + schedule[i][0]], dp[i] + schedule[i][1])
    }
  }
  print(dp[0...n].max()!)
  
}
