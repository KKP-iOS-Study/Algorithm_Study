//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/21.
//


let wordArr = Array(readLine()!)
let alpa = Array("abcdefghijklmnopqrstuvwxyz")

var binArr = [Int](repeating: 0, count: alpa.count)

for i in wordArr {
    let idx = alpa.firstIndex(of: i)!
    binArr[idx] += 1
}

print(binArr.map{String($0)}.joined(separator: " "))

