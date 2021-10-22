/*
DP 쉬운 계단 수 10844.swift
Created by: hoseung Lee on 2021/10/22
https://www.acmicpc.net/problem/10844
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study
*/

func boj10844() {
  let n = Int(readLine()!)!
  var dp = [0] + [Int](repeating: 1, count: 9)

  for _ in 1..<n {
      let previousTable = dp
      dp[0] = previousTable[1]
      for j in 1...8 {
          dp[j] = (previousTable[j-1] + previousTable[j+1]) % 1000000000
      }
      dp[9] = previousTable[8]
  }

  print(dp.reduce(0, +) % 1000000000)
}

//|N|0|1|2|3|4|5|6|7|8|9|
//|-|-|-|-|-|-|-|-|-|-|-|
//|1|0|1|1|1|1|1|1|1|1|1|
//|2|1|1|1|2|2|2|2|2|2|1|
//|3|1|3|3|4|4|4|4|4|3|2|
//|4|3|4|7|7|8|8|8|7|6|3|
//
//
//|N|0|1|2|3|4|5|6|7|8|9|
//|-|-|-|-|-|-|-|-|-|-|-|
//|1|0|1|2|3|4|5|6|7|8|9|
//|2|10|21|12,32|23,43|34,54|45,65|56,76|67,87|78,97|89|
//|3|210|101,121,321|212,232,432|123,323,343,543|234434,454,654|345,545,565,765|
//|4|1010,1210,3210|2101,2121,2321,4321|1012,1212,3212,1232,3232,3432,5432|
//
