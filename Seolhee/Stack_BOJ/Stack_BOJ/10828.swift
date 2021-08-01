// BOJ #10828 스택

import Foundation

let count = Int(readLine()!)!

var stack = [Int]()

for _ in 0..<count {
    let command = readLine()!.components(separatedBy: " ")
    
    if command[0] == "push" { stack.append(Int(command[1])!) }
    else if command[0] == "pop" {
        if stack.isEmpty { print(-1) }
        else { print(stack.removeLast()) }
    }
    else if command[0] == "size" { print(stack.count) }
    else if command[0] == "empty" {
        if stack.isEmpty { print(1) }
        else { print(0) }
    }
    else if command[0] == "top" {
        if stack.isEmpty { print(-1) }
        else { print(stack[stack.count-1]) }
    }
}
