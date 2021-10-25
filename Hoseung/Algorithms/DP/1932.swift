//
/*
DP 정수 삼각형 1932.swift
Created by: hoseung Lee on 2021/10/20
https://www.acmicpc.net/problem/1932
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/
//dpX = max(dpX-1, dpX) + graphX

func boj1932() {
  let size = Int(readLine()!)!
  var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: size + 2), count: size + 2)
  var maximumPath = 0
  for row in 1...size {
    for (index, strNumber) in readLine()!.split(separator: " ").enumerated() {
      let col = index + 1
      dp[row][col] = max(dp[row - 1][col - 1], dp[row - 1][col]) + Int(String(strNumber))!
      maximumPath = max(maximumPath, dp[row][col])
    }
  }
  
  print(maximumPath)
  
}
