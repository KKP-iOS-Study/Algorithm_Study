//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/18.
//

let N = Int(readLine()!)!

var P = readLine()!.split(separator: " ").map{Int(String($0))!}
P.sort(by: <)

var arr = [Int]()
var ans = [Int]()

for i in 0..<N {
    arr.append(P[i])
    ans.append(arr.reduce(0, +))
}

print(ans.reduce(0, +))
