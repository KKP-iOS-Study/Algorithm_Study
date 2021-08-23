// BOJ #7570 줄 세우기

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var tmp1 = [Int]()
var tmp2 = [Int]()
var sorted1 = [Int]()
var sorted2 = [Int]()
var answer = 0
var t = 0

while true {
    if nums[t] > nums[t+1] { tmp1.append(nums[t+1]); tmp2.append(nums[t]) }
    else { sorted1.append(nums[t+1]); sorted2.append(nums[t]) }
    //else { if t == n-2 { tmp2.append(nums[t+1]) } }
    if t == n-2 { break }
    t += 1
}

print(tmp1)
print(tmp2)
print(sorted1)
print(sorted2)

if tmp1.count == 0 && tmp2.count == 0 { print(0) }
else {
    if tmp1.count > tmp2.count { answer += tmp2.count; sorted1 = sorted2; tmp1 = tmp2 }
    else { answer += tmp1.count }

    if sorted1.count <= 1 { print(tmp1.count) }
    else {
        for i in 0..<sorted1.count-1 {
            if nums[i] > nums[i+1] { answer += 1 }
        }
        print(answer)
    }
}
