// BOJ #7570 줄 세우기
//
// DP로 풀었더니 시간초과;
// #1965번이랑 비슷한 문제가 맞긴한데 이건 이분탐색 이용해야할듯

import Foundation

var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map({Int(String($0))!})
var count = [Int]()
var max = 1

for i in 0..<n {
    count.append(1)
    for j in 0..<i {
        if input[j] < input[i] && count[j] <= count[i] { count[i] = count[j]+1 }
    }
    if max < count[i] { max = count[i] }
}

print(n - max)
