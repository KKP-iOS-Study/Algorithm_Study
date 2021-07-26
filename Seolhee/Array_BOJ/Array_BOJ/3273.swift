// BOJ 3273

import Foundation

let count = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").map({Int($0)!}).sorted()
let sum = Int(readLine()!)!
var max = nums.count

var result = 0

for i in 0..<nums.count-1 {
    if i < max {
        for j in (i+1..<max).reversed() {
            if i < j {
                if nums[i] + nums[j] == sum {
                    result += 1
                    max = j
                    break
                }
            }
        }
    }
}

print(result)

