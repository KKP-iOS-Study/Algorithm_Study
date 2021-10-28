/*
BS 랜선 자르기 1654.swift
Created by: hoseung Lee on 2021/10/28
https://www.acmicpc.net/problem/1654
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/
func boj1654() {
  let kn = readLine()!.split(separator: " ").map{Int(String($0))!}
  let (k, n) = (kn[0], kn[1])
  
  var lenCables: [Int] = .init(repeating: 0, count: k)
  
  var rbound = 0
  for index in 0..<k {
    lenCables[index] = Int(readLine()!)!
    rbound = max(rbound, lenCables[index])
  }
  
  var lbound = 1
  
  var maxCuttingLength = 0
  while rbound >= lbound {
    let mid = (lbound + rbound) / 2
    let cuttingSum = lenCables.reduce(0) { $0 + $1 / mid }
    
    if cuttingSum >= n {
      maxCuttingLength = maxCuttingLength > mid ? maxCuttingLength : mid
      lbound = mid + 1
    } else {
      rbound = mid - 1
    }
  }
  print(maxCuttingLength)
}


//재귀로 풀었는데 왜 틀리는지 모르겠음 ㅎ
//func boj1654() {
//  let kn = readLine()!.split(separator: " ").map{Int(String($0))!}
//  let (k, n) = (kn[0], kn[1])
//
//  var lenCables: [Int] = .init(repeating: 0, count: k)
//
//  var maxLen = 0
//  for index in 0..<k {
//    lenCables[index] = Int(readLine()!)!
//    maxLen = max(maxLen, lenCables[index])
//  }
//
//  func bs(lbound: Int, rbound: Int, maxCutLength: Int) -> Int {
//    if lbound >= rbound { return maxCutLength }
//    let mid = (lbound + rbound) / 2
//
//    let cuttingSum = lenCables.reduce(0) { $0 + $1 / mid }
//
//    if cuttingSum >= n {
//      return max(mid, bs(lbound: mid + 1, rbound: rbound, maxCutLength: mid))
//    } else {
//      return bs(lbound: lbound, rbound: mid - 1, maxCutLength: maxCutLength)
//    }
//  }
//  print(bs(lbound: 1, rbound: maxLen, maxCutLength: 0))
//}
