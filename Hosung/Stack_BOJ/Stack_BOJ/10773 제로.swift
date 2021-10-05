//
//  main.swift
//  Stack_BOJ
//
//  Created by 강호성 on 2021/08/01.
//

var ans = [Int]()

for _ in 0..<Int(readLine()!)! {
    
    let num = Int(readLine()!)!
    
    if num == 0 {
        ans.removeLast()
    } else {
        ans.append(num)
    }
    
}
print(ans.reduce(0, +))

