//
//  9012.swift
//  Stack_BOJ
//
//  Created by 박소민 on 2021/08/12.
//

import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = Array(readLine()!)
    var openArray = [Int]()
    var answer = true
    for i in input {
        if i == "(" {
            openArray.append(1)
        }else {
            if openArray.count == 0 {
                answer = false
                break
            }
            openArray.removeLast()
        }
    }
    if !answer  || openArray.count != 0 {
        print("NO")
    }else {
        print("YES")
    }
}
