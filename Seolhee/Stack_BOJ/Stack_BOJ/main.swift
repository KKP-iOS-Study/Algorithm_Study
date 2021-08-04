// BOJ #2483 탑

import Foundation

let count = Int(readLine()!)!
var top = readLine()!.components(separatedBy: " ").map({Int($0)!})
var tmp = [Int]()
var result = Array(repeating: 0, count: count)
var n = count

for i in (1..<count).reversed() {
    if top[i] < top[i-1] {
        tmp.append(top.removeLast())
        for j in i...(n-1) {
            result[j] = i
        }
        n = i
    }
}

print(result.map{String($0)}.joined(separator: " "))
