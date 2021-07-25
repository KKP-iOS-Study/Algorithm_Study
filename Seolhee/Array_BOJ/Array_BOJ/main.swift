// BOJ 3273

import Foundation

let count = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ")
let sum = Int(readLine()!)!

var result = 0

for i in 0..<nums.count-1 {
    for j in i+1..<nums.count {
        if Int(nums[i])! + Int(nums[j])! == sum {
            result += 1
        }
    }
}

print(result)

