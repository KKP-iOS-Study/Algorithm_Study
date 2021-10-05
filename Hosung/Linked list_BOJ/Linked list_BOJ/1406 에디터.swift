//
//  main.swift
//  Linked list_BOJ
//
//  Created by 강호성 on 2021/07/27.
//


// 스택

var left = Array(readLine()!)
var right = [Character]()

let M = Int(readLine()!)!

for _ in 0..<M {
    let command = readLine()!

    // left -> right
    if command == "L" {
        if !left.isEmpty {
            
            // insert -> O(n) 런타임에러
            // right.insert(left.removeLast(), at: 0)
            
            right.append(left.removeLast())
        }
    } else if command == "D" { // right -> left
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    } else if command == "B" { // left 마지막 삭제
        if !left.isEmpty {
            left.removeLast()
        }
    } else { // left 마지막에 추가
        left.append(command.last!)
    }
}
print((left + right.reversed()).map{String($0)}.joined())
