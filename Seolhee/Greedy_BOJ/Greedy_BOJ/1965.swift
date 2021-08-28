// BOJ #1965 상자넣기
//
// LIS 예제로 풀어봄

import Foundation

var n = Int(readLine()!)!
var box = readLine()!.split(separator: " ").map({Int(String($0))!})
var count = [Int]()
var max = 1

for i in 0..<n {
    count.append(1)
    
    for j in 0..<i {
        if box[j] < box[i] && count[i] <= count[j] { count[i] = count[j]+1 }
    }
    
    if max < count[i] { max = count[i] }
}

print(max)
