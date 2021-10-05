//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/08.
//


let N = Int(readLine()!)!
var stack = [Int]()
var ans = 0

for _ in 0..<N {

    let bHeight = Int(readLine()!)!
    
    while !stack.isEmpty && stack.last! <= bHeight {
        stack.removeLast()
    }
    
    ans += stack.count
    stack.append(bHeight)
}

print(ans)



//let N = Int(readLine()!)!
//var stack = [Int]()
//var ans = 0
//
//for _ in 0..<N {
//
//    let bHeight = Int(readLine()!)!
//    print("input = \(bHeight)")
//    while !stack.isEmpty && stack.last! <= bHeight {
//        print("while")
//        print("stack \(stack)")
//        print("stack last \(stack.last)")
//        stack.removeLast()
//        print("remove stack = \(stack)")
//        print("\n")
//    }
//
//    print("탈출 후 \(stack)")
//    print("\(bHeight)를 볼 수 있는 인덱스 갯수는 \(stack.count)개 \(stack)")
//    ans += stack.count
//    print("ans \(ans)")
//    stack.append(bHeight)
//    print(stack)
//    print("\n")
//
//}

//print(ans)
