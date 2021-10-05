//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/08.
//

let T = Int(readLine()!)!

for _ in 0..<T {
    let s = readLine()!
    var cnt = 0

    for i in s {
        if i == "(" { cnt += 1 } else { cnt -= 1 }
        if cnt < 0 { break }
    }
    print(cnt == 0 ? "YES" : "NO")
}
