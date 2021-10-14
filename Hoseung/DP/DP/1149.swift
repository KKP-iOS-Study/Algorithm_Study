//
/*
DP RGB거리 1149.swift
Created by: hoseung Lee on 2021/10/14
https://www.acmicpc.net/problem/1149
https://github.com/KKP-iOS-Study/Algorithm_Study

KKP-iOS-Study : Algorithm Study

*/

func boj1149() {
  let houseCnt = Int(readLine()!)!
  var rgbStreet: [[Int]] = .init(repeating: [], count: houseCnt)
  
  for idx in 0..<houseCnt {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    rgbStreet[idx].append(contentsOf: input)
  }
  
  //dp 초기값을 count를 4로 하고 min할 것을 고려해서 비용 1000으로 초기화 했는데 이부분이 틀렸음
  //예를들어 1번집 비용이 각각 1000 1000 1000 1000
  //입력이 들어오면 최소값이 인덱스 0이 잘못된 값 전달
  var dp: [[Int]] = .init(repeating: .init(repeating: 100 * 100, count: 3), count: houseCnt)
  
   dp[0][0] = rgbStreet[0][0]
   dp[0][1] = rgbStreet[0][1]
   dp[0][2] = rgbStreet[0][2]
  
  for idx in 1..<houseCnt {
    dp[idx][0] = min(dp[idx - 1][1], dp[idx - 1][2]) + rgbStreet[idx][0]
    dp[idx][1] = min(dp[idx - 1][0], dp[idx - 1][2]) + rgbStreet[idx][1]
    dp[idx][2] = min(dp[idx - 1][0], dp[idx - 1][1]) + rgbStreet[idx][2]
  }
  print(dp[houseCnt - 1].min()!)
}
