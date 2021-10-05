//
//  main.swift
//  Queue_BOJ
//
//  Created by 강호성 on 2021/08/10.
//

// push, pop, size, empty, front, back


var queue = [Int]()
var pop = [Int]()

let N = Int(readLine()!)!

for _ in 0..<N {
    
    let command = readLine()!.split(separator: " ").map{String($0)}
    
    if command[0] == "empty" {
        queue.isEmpty ? print("1") : print("0")
        
    } else if command[0] == "size" {
        print(queue.count)
        
    } else if command[0] == "front" {
        queue.isEmpty ? print("-1") : print(queue.first!)
        
    } else if command[0] == "back" {
        queue.isEmpty ? print("-1") : print(queue.last!)
        
    } else if command[0] == "push" {
        queue.append(Int(command[1])!)
        
    } else if command[0] == "pop" {
        
        if !queue.isEmpty {
            pop.append(queue.removeFirst())
            print(pop.last!)
        } else {
            print("-1")
        }
        
    }
}
