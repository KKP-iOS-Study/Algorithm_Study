//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/22.
//

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)

for i in 1..<10 { dp[0][i] = 1 } // [[0, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ...]

// dp[index][i] -> index에 1부터 하나씩(i) 증가하는 방향으로 업데이트
for i in 1..<n {
    // 0, 9 는 따로 처리해주고
    dp[i][0] = dp[i-1][1] // 0은 이전 값 1번째 값 그대로 가져온다
    dp[i][9] = dp[i-1][8] // 9는 이전 값 8번째 값 그대로 가져온다
    
    // 나머지 1에서 8은 위아래 값들의 합
    for j in 1...8 {
        dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
    }
}

// n-1번째 인덱스의 합이 계단의 수
print(dp[n-1].reduce(0, +) % 1000000000)
