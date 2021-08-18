//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/18.
//

let N = Int(readLine()!)!

var A = readLine()!.split(separator: " ").map{ Int(String($0))! }
var B = readLine()!.split(separator: " ").map{ Int(String($0))! }

A.sort(by: <)
B.sort(by: >)

var ans = [Int]()

for i in 0..<N {
    ans.append(A[i]*B[i])
}

print(ans.reduce(0, +))


