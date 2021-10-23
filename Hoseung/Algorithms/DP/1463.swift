//
/*
DP 1로 만들기 1463.swift
Created by: hoseung Lee on 2021/10/14
https://www.acmicpc.net/problem/1463
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

//
//func boj1463(_ x: Int) -> Int {
//  x < 2 ? 0 : min(boj1463(x / 2) + x % 2, boj1463(x / 3) + x % 3) + 1
//}
//
//print(boj1463(Int(readLine()!)!))
//
//

func boj1463() {
  let input = Int(readLine()!)!
    
  guard input > 1 else { print(0); return }
  var dp: [Int] = .init(repeating: 0, count: 1000001)
  
  for i in 2...input {
    dp[i] = dp[i - 1] + 1
    if i % 2 == 0 { dp[i] = min(dp[i], dp[i / 2] + 1) }
    if i % 3 == 0 { dp[i] = min(dp[i], dp[i / 3] + 1) }
  }
  
  print(dp[input])
}
