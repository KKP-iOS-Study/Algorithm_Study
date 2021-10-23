//
/*
DP 1로 만들기2 12852.swift
Created by: hoseung Lee on 2021/10/17
https://www.acmicpc.net/problem/12852
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/


func boj12852() {
  let input = Int(readLine()!)!
    
  guard input > 1 else { print("0\n1"); return }
  var dp: [Int] = .init(repeating: 0, count: input + 1)
  var paths: [Int] = .init(repeating: 0, count: input + 1)
  
  for i in 2...input {
    dp[i] = dp[i - 1] + 1
    paths[i] = i - 1
    if i % 2 == 0 && dp[i] > dp[i / 2] + 1 {
      dp[i] = dp[i / 2] + 1
      paths[i] = i / 2
    }
    
    if i % 3 == 0 && dp[i] > dp[i / 3] + 1 {
      dp[i] = dp[i / 3] + 1
      paths[i] = i / 3
    }
  }
  
  print(dp[input])
  var root = "\(input) "
  var index = input
  while paths[index] > 0 {
    let next = paths[index]
    root.write("\(next) ")
    index = next
  }
  print(root)
}
