//
//  2577.swift
//  Array_BOJ
//
//  Created by 박소민 on 2021/07/28.
//

import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
var multipleArray = Array(String(A * B * C).compactMap{$0.wholeNumberValue})
for i in 0...9 {
    print(multipleArray.filter{$0 == i}.count)
}
