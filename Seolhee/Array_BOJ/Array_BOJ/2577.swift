// BOJ #2577

import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let multi = String(A*B*C)
var result = Array(repeating: 0, count: 10)

for i in multi {
    result[Int(String(i))!] += 1
}

print(result.map({String($0)}).joined(separator : "\n"))
