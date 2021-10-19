//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/18.
//

let n = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var rgb = [[Int]]()

for _ in 0..<n {
    let cost = readLine()!.split(separator: " ").map{Int(String($0))!}
    rgb.append(cost)
}

// dp에 처음 rgb 값을 넣고, 2번집부터 각 집의 최솟값을 찾아 누적합을 구함
dp[0][0] = rgb[0][0]
dp[0][1] = rgb[0][1]
dp[0][2] = rgb[0][2]

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + rgb[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + rgb[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + rgb[i][2]
}

print(dp.last!.min()!)
