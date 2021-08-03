//
//  main.swift
//  Array_BOJ
//
//  Created by 박소민 on 2021/07/21.
//

/* a a
 ab ba
 ring gnir
 newt twan */

import Foundation

let N = Int(readLine()!)!
var answerArray = [String]()
for i in 0..<N {
    let temp = readLine()!.components(separatedBy: " ")
    var first = Array(temp[0]).map{Character($0)}
    for i in first {
        if second.filter{$0 == i}.count == 0 {
            answerArray.append("Impossible")
            break
        }
        second.remove(at: second.firstIndex(of: i)!)
    }
    if second.count == 0 {
        answerArray.append("Impossible")
    }
    else {
        answerArray.append("Impossible")
    }
}
print(answerArray)

