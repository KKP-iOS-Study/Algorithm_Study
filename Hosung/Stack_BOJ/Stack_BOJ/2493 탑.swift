//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/06.
//


let N = Int(readLine()!)!
let topHeight = readLine()!.split(separator: " ").map{Int($0)!}
var stack = [(Int,Int)]()
var ans = ""

for i in 0..<N {
    while !stack.isEmpty, stack.last!.0 < topHeight[i] {
        stack.removeLast()
    }

    ans.append(stack.isEmpty ? "0 " : "\(stack.last!.1) ")
    stack.append((topHeight[i], i+1))
}

print(ans)

/*
let N = Int(readLine()!)!
let topHeight = readLine()!.split(separator: " ").map{Int($0)!}
var stack = [(Int,Int)]()
var ans = ""

for i in 0..<N {
    print(topHeight[i])
    print("while문 입장")
    while !stack.isEmpty, stack.last!.0 < topHeight[i] {
        print("topHeight[i]: \(topHeight[i]) > stack.last.0: \(stack.last!.0)")
        print("stack \(stack)")
        stack.removeLast()
        print("remove Stack \(stack)")
        print("\n")
    }
    
    print("while문 탈출")
    ans.append(stack.isEmpty ? "0 " : "\(stack.last!.1) ")
    stack.append((topHeight[i], i+1))
    print("ans = \(ans)")
    print("topHeight[i] = \(topHeight[i]), stack = \(stack)")
    print("\n")
}

print(ans)
*/
