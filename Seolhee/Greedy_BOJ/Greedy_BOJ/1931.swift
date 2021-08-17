// BOJ #1931 회의실 배정

import Foundation

let count = Int(readLine()!)! // 회의 총 개수
var times = [[Int]]() // 회의 시작, 끝 시간 저장하는 2차원 배열
var answer = 0

for _ in 0..<count  {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    times.append([input[0], input[1]])
}

times.sort(by: { $0[0] < $1[0] }) // 시작하는 시간 기준 오름차순 정렬
times.sort(by: { $0[1] < $1[1] }) // 끝나는 시간 기준 오름차순 정렬

var check = 0

for i in times {
    if i[0] >= check {
        check = i[1]
        answer += 1
    }
}

print(answer)
