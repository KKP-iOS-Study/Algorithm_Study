//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/25.
//


let one = readLine()!
let two = readLine()!

let alpa = Array("abcdefghijklmnopqrstuvwxyz")
var ans = 0

var arr = [Int](repeating: 0, count: alpa.count)

for i in one {
    let oneIdx = alpa.firstIndex(of: i)!
    arr[oneIdx] += 1
}

for j in two {
    let twoIdx = alpa.firstIndex(of: j)!
    arr[twoIdx] -= 1
}

for a in arr {
    if a != 0 {
        ans += abs(a)
    }
}

print(ans)

