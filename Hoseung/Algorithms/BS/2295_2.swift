/*
BS 세 수의 합 2295.swift
Created by: hoseung Lee on 2021/10/28
https://www.acmicpc.net/problem/2295
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/

//BS이용한 풀이
func boj2295_2() {
  let n = Int(readLine()!)!
  var u: [Int] = .init(repeating: 0, count: n)
  
  var table: [Int] = []
  
  for index in 0..<n {
    u[index] = Int(readLine()!)!
    for target in 0...index {
      table.append(u[index] + u[target])
    }
  }
  
  u.sort()
  table.sort()
  
  func bs(lbound: Int, rbound: Int, target: Int) -> Bool {
    if lbound >= rbound { return false }
    let mid = (lbound + rbound) / 2
    if table[mid] == target {
      return true
    }
    if table[mid] > target {
      return bs(lbound: lbound, rbound: mid - 1, target: target)
    } else {
      return bs(lbound: mid + 1, rbound: rbound, target: target)
    }
  }
  
  for first in u.reversed() {
    for second in u.reversed() {
      if bs(lbound: 0, rbound: table.count, target: first - second) {
        print(first)
        return
      }
    }
  }
}
