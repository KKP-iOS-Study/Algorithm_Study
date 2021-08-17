// BOJ #11399 ATM

import Foundation

let num = Int(readLine()!)!
var line = readLine()!.split(separator: " ").map({Int(String($0))!})
var sum = 0

line.sort(by: >) // 내림차순 정렬

for i in 0..<num {
    sum += line[i] * (i+1) // 첫 번째 사람은 *num ~ 마지막 사람은 *1
}

print(sum)
