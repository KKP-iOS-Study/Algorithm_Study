/*
BS 세 수의 합 2295.swift
Created by: hoseung Lee on 2021/10/28
https://www.acmicpc.net/problem/2295
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/

//Set이용한 풀이
func boj2295_1() {
  let n = Int(readLine()!)!
  var u: [Int] = .init(repeating: 0, count: n)
  
  var table: Set<Int> = []
  
  for index in 0..<n {
    u[index] = Int(readLine()!)!
    for target in 0...index {
      table.insert(u[index] + u[target])
    }
  }
  
  u.sort()

  for first in u.reversed() {
    for second in u.reversed() {
      if table.contains(first - second) {
        print(first)
        return
      }
    }
  }
}
