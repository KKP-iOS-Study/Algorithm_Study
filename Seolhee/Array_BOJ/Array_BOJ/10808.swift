// BOJ #10808

import Foundation

let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
var result = Array(repeating: "0", count: 26)
var inputStr = readLine()!
var check = [String]()

for i in inputStr {
    if !check.contains(String(i)) {
        var temp = 0
        for j in inputStr {
            if i == j { temp += 1 }
        }
        result[alphabet.firstIndex(of: i)!] = String(temp)
    }
    check.append(String(i))
}

print(result.joined(separator: " "))

