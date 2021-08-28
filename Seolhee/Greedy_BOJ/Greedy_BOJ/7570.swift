// BOJ #7570 줄 세우기

import Foundation

var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map({Int(String($0))!})
var position = Array(repeating: 0, count: n)
var count = 1
var max = 0

for i in 0..<n {
    position[input[i]-1] = i
}

for i in 0..<n-1 {
    if position[i] < position[i+1] {
        count += 1
        if count > max { max = count }
    }
    else { count = 1 }
}

print(n - max)
