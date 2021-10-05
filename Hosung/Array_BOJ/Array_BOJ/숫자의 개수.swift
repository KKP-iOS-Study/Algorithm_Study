//
//  main.swift
//  Array_BOJ
//
//  Created by 강호성 on 2021/07/27.
//

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!

let value = String(A*B*C)
var number = Array(repeating: 0, count: 10)

value.forEach { num in
    number[Int(String(num))!] += 1
}

// 1.
number.forEach { ans in
    print(ans)
}

// 2.
//print(number.map{String($0)}.joined(separator: "\n"))
