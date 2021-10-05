//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/25.
//

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let x = Int(readLine()!)!

var cnt = 0
var left = 0
var right = n-1

while left != right {
    if nums[left] + nums[right] == x {
        cnt += 1
        left += 1
    } else if nums[left] + nums[right] > x {
        right -= 1
    } else {
        left += 1
    }
}

print(cnt)
