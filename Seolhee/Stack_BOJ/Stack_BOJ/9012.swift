// BOJ #9012 괄호

import Foundation

let count = Int(readLine()!)!

for _ in 0..<count {
    let input = readLine()!
    var stack = [Character]()
    var check = true
    
    for i in input {
        if i == "(" {
            stack.append(i)
        }
        else {
            if stack.isEmpty { check = false; break }
            else { stack.removeLast() }
        }
    }
    
    if check == false { print("NO") }
    else {
        if !stack.isEmpty { print("NO") }
        else { print("YES") }
    }
}
