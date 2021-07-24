// BOJ #10807

import Foundation

let count = readLine()!
let nums = readLine()!.components(separatedBy: " ").map({String($0)})
let v = readLine()!
var result = 0

for i in nums {
    if String(i) == v { result += 1 }
}

print(result)

