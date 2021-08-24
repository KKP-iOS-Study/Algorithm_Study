// BOJ #7570 줄 세우기
//
// LIS 알고리즘 공부하고. 다시 풀어보자..

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var arr1 = [nums[0]]
var arr2 = [Int]()

for i in 1..<n {
    if arr1.last! < nums[i] { arr1.append(nums[i]) }
    else { arr2.append(nums[i]) }
}

arr1.count > arr2.count ? print(n - arr1.count) : print(n - arr2.count)

