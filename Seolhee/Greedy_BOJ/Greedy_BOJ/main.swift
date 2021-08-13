// BOJ #1931 회의실 배정
//
// 시간초과,, 다른 방법 다시 생각해보자

import Foundation

let count = Int(readLine()!)!
var times = [[Int]]()
var max = 0
var terms = [Int]()
var answer = 0

for _ in 0..<count  {
    var input = readLine()!.split(separator: " ").map({Int(String($0))!})
    input.append(input[1] - input[0])
    times.append(input)
    if !terms.contains(input[2]) { terms.append(input[2]) }
    if input[1] > max { max = input[1] }
}

var timeLine = Array(repeating: 0, count: max)
terms.sort(by : >)

while !terms.isEmpty && timeLine.contains(0) {
    for i in 0..<times.count {
        var check = true
        if times[i][2] == terms.last! {
            for j in times[i][0]+1...times[i][1] {
                if timeLine[j - 1] == 1 { check = false; break }
            }
            if check == true {
                for j in times[i][0]+1...times[i][1] {
                    timeLine[j - 1] = 1
                }
                answer += 1
            }
        }
    }
    terms.removeLast()
}

print(answer)
