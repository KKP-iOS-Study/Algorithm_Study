// BOJ #2164 카드2

import Foundation

let N = Int(readLine()!)!
var queue = Array(1...N)
var tmp = 0 // 포인터처럼 사용하기 위한 tmp 변수

if N == 1 { print(1) } // 1일 경우 while 돌리기 불가 => 예외로 빼줌
else {
    while true {
        queue[tmp] = 0 // 숫자 지우기
        queue.append(queue[tmp + 1]) // 지운 숫자 바로 뒤 숫자를 맨 뒤에 추가
        queue[tmp + 1] = 0 // 추가한 숫자 지우기
        // queue 맨 뒤에서 두 번째가 0이면 더 반복 필요 없고, 맨 뒤 숫자가 답이기 때문에 바로 break
        if queue[queue.count - 2] == 0 { print(queue.last!); break }
        tmp += 2 // 숫자 두 개씩 지우므로, 2씩 증가시켜주기
    }
}
