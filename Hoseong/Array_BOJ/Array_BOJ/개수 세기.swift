//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/21.
//

let N = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{Int($0)!}
let v = Int(readLine()!)!
print(num.filter{$0 == v}.count)


