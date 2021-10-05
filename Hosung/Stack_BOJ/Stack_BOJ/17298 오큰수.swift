//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/09.
//

let N = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [Int]()

for i in 0..<N {
    while !stack.isEmpty && num[i] > num[stack.last!] {
        
        num[stack.removeLast()] = num[i]
    }
    stack.append(i)
}

for i in stack {
    num[i] = -1
}

print(num.map { String($0) }.joined(separator: " "))



// 시간 초과,,

/*
let N = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map { Int($0)! }

var stack = [Int]()
var ans = [String](repeating: "-1", count: N)

for i in 0..<N {

    while !stack.isEmpty && num[i] > stack.last! {
        
        ans[num.firstIndex(of: stack.removeLast())!] = "\(num[i])"
        
    }

    stack.append(num[i])
}

print(ans.joined(separator: " "))
*/
