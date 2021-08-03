//
//  10807.swift
//  Array_BOJ
//
//  Created by 박소민 on 2021/07/27.
//

import Foundation

let N = readLine()!
let numberArray = readLine()!.components(separatedBy: " ")
let v = readLine()!

print(numberArray.filter{$0 == v}.count)
