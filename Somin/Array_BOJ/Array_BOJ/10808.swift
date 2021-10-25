//
//  10808.swift
//  Array_BOJ
//
//  Created by 박소민 on 2021/07/27.
//

import Foundation

let N = Array(readLine()!)
let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
var answerArray = [Int](repeating: 0, count: 26)
var countAlphabet = 0

for i in N {
    answerArray[alphabet.firstIndex(of: i)!] += 1
}
print(answerArray.map{String($0)}.joined(separator:" "))
