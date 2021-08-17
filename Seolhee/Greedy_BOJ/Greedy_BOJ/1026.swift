// BOJ #1026 보물
//
// 그냥 A배열, B배열 각각 오름차순, 내림차순 정렬해서 곱해주었음.

import Foundation

let count = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map({Int(String($0))!})
let B = readLine()!.split(separator: " ").map({Int(String($0))!})

var A_sort = A.sorted(by: >)
var B_sort = B.sorted(by: <)

var sum = 0

for _ in 0..<count {
    sum += A_sort.removeLast() * B_sort.removeLast()
}

print(sum)
