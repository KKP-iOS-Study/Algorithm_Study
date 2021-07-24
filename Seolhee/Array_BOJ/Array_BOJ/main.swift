// BOJ #10808

import Foundation

let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
var result = Array(repeating: "0", count: 26)

var inputStr = readLine()!

for i in inputStr {
    var temp = 0
    for j in inputStr {
        if i == j { temp += 1 }
    }
    inputStr = inputStr.filter({$0 != i})
    result[alphabet.firstIndex(of: "i")!] = String(temp)
}

print(result.joined(separator: " "))

