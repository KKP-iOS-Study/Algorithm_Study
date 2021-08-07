// BOJ #17298 오큰수
//
// 2493, 6298번 문제와 비슷하여 같은 방식으로 풀어줬는데, 계속 시간초과,,ㅜ

import Foundation

var count = Int(readLine()!)!
var nums = readLine()!.components(separatedBy: " ").map({Int($0)!})
var stack = [[0, nums[0]]]
var answer = Array(repeating: -1, count: count)

for i in 1..<nums.count {
    while nums[i] > stack[stack.count-1][1] {
        answer[stack.removeLast()[0]] = nums[i]
        if stack.isEmpty { break }
    }
    stack.append([i, nums[i]])
}

print(answer.map({String($0)}).joined(separator: " "))
