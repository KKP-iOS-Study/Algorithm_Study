//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/06.
//

let N = Int(readLine()!)!
let topHeight = readLine()!.split(separator: " ").map{Int($0)!}
var res = [Int](repeating: 0, count: N)
var stack = [Int]()

stack.append(topHeight[0])

for i in 1..<N {
    
    if topHeight[i] > stack.last! {
        stack.append(topHeight[i])
        
        for s in stack {
            if topHeight[i] < s && i > 1 {
                res[i] = topHeight.firstIndex(of: s)! + 1
            }
        }
    } else {
        res[i] = topHeight.firstIndex(of: stack.last!)! + 1
        stack.append(topHeight[i])
    }
}
print(res.map { String($0) }.joined(separator: " "))
