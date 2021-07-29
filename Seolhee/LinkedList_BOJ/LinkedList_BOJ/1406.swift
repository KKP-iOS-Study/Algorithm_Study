// BOJ #1406

import Foundation

var left = Array(readLine()!)
var right = [Character]()
let count = Int(readLine()!)!

for _ in 0..<count {
    let edit = readLine()!
    if edit == "L" && !left.isEmpty { right.append(left.removeLast()) }
    else if edit == "D" && !right.isEmpty { left.append(right.removeLast()) }
    else if edit == "B" && !left.isEmpty { left.removeLast() }
    else if edit.first! == "P" { left.append(edit.last!) }
}

print(String(left + right.reversed()))
