//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/10/26.
//

let N = Int(readLine()!)!
var nArr = readLine()!.split(separator: " ").map{Int(String($0))!}
nArr.sort()

let M = Int(readLine()!)!
var mArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var result = [Int](repeating: 0, count: M)
var cnt = [Int: Int]()

for i in nArr {
    if cnt.keys.contains(i) {
        cnt[i]! += 1
    } else {
        cnt[i] = 1
    }
}

for m in 0..<M {
    if cnt.keys.contains(mArr[m]) {
        result[m] = cnt[mArr[m]]!
    } else {
        result[m] = 0
    }
}

print(result.map{String($0)}.joined(separator: " "))
