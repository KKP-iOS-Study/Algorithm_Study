//
/*
DP 구간 합 구하기4 11659.swift
Created by: hoseung Lee on 2021/10/15
https://www.acmicpc.net/problem/11659
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj11659() {
  let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
  let n = nm[0]
  let m = nm[1]
  var dp: [Int] = .init(repeating: 0, count: n + 1)
  var dpIndex = 1
  func fillTable(_ subString: Substring) -> Int {
    let convert = Int(String(subString))!
    dp[dpIndex] = dp[dpIndex-1] + convert
    dpIndex += 1
    return convert
  }
  let _ = readLine()!.split(separator: " ").map(fillTable(_:))
  var result = ""
  for _ in 1...m {
    let ij = readLine()!.split(separator: " ").map {Int(String($0))!}
    let (i, j) = (ij[0], ij[1])
    result.write("\(dp[j] - dp[i-1])\n")
  }
  print(result)
}
