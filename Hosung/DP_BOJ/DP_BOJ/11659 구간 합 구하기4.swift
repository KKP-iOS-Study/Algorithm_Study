//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/20.
//

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0] // 수의 갯수
let m = nm[1] // 구해야 하는 횟수

let num = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp = [Int](repeating: 0, count: n+1)

for idx in 1...n { dp[idx] = dp[idx-1] + num[idx-1] }

for _ in 1...m {
    let ij = readLine()!.split(separator: " ").map{Int(String($0))!}
    let i = ij[0], j = ij[1]

    print(dp[j]-dp[i-1])
}

