//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/01.
//

let N = Int(readLine()!)!

var stack = [Int]() // N만큼의 정수를 담는 배열
var res = [Int]() // pop
var ans = [String]() // +,-
var cnt = 1 // 돌아오는 n에서 1부터 시작하는거 방지

var check = [Int]()

for _ in 1...N { // 1~8
    
    let n = Int(readLine()!)!
    check.append(n)
    
    while cnt <= n {
        stack.append(cnt)
        cnt += 1
        ans.append("+")
    }
    
    if stack.last == n {
        res.append(stack.removeLast())
        ans.append("-")
    }
}

if res != check {
    print("NO")
} else {
    print(ans.joined(separator: "\n"))
}

