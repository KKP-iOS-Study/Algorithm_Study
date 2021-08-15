// BOJ #10773 제로

import Foundation

let count = Int(readLine()!)!

var stack = [Int]()
var result = 0

for _ in 0..<count {
    let input = Int(readLine()!)!
    if input != 0 { stack.append(input) }
    else { stack.removeLast() }
}

for i in stack {
    result += i
}

print(result)
