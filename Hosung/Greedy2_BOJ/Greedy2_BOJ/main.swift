//
//  main.swift
//  Greedy2_BOJ
//
//  Created by 강호성 on 2021/11/29.
//

let N = readLine()!.sorted(by: >)

let arr = N.map{Int(String($0))!}
let arrSum = arr.reduce(0, +)

var ans = ""

if arrSum % 3 == 0 && N.contains("0") {
    for i in N {
        ans += String(i)
    }
    print(ans)
} else {
    print(-1)
}
