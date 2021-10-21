//
//  main.swift
//  DP_BOJ
//
//  Created by 강호성 on 2021/10/21.
//

// p[n] = p[n-1] + p[n-5]

let test = Int(readLine()!)!

var p = [Int](repeating: 0, count: 100)

p[0...4] = [1, 1, 1, 2, 2]

for _ in 0..<test {
    let n = Int(readLine()!)!-1

    for i in 5...n {
        p[i] = p[i-1] + p[i-5]
    }

    print(p[n])
}

