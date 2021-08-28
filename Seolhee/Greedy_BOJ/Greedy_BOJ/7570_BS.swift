// BOJ #7570 줄 세우기
//
// 이분 탐색으로 풀었으나,,
// 이 문제 자체가 LIS가 아니네....
// 원하는 수를 원하는 자리에 옮길 수 있는 문제면 이렇게 하는게 맞는데,
// 무조건 맨 앞이나 맨 뒤로만 옮길 수 있기 때문에 LIS로 풀 수 없음.

import Foundation

var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map({Int(String($0))!})
var lis = [Int]()

func BinarySearch(_ start: Int, _ end: Int, _ value: Int) -> Int {
    var m = 0
    var s = start
    var e = end
    
    while s < e {
        m = (s + e) / 2
        if value <= lis[m] { e = m }
        else { s = m + 1 }
    }
    
    return s
}

for i in 0..<n {
    if lis.isEmpty { lis.append(input[i]) }
    else if lis.last! < input[i] { lis.append(input[i]) }
    else {
        lis[BinarySearch(0, lis.count-1, input[i])] = input[i]
    }
}

print(n - lis.count)
