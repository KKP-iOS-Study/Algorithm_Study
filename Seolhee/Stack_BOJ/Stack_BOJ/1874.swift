// BOJ #1874 스택 수열

import Foundation

var n = Int(readLine()!)!

var point = Array(repeating: 0, count: n) // 숫자별로 입력됐는지 확인
var max = 0 // 지금까지 입력된 숫자 중 가장 큰 수
var pre = 0
var result = [String]() // push, pop 저장
var answer = ""

for i in 0..<n {
    let num = Int(readLine()!)!
    
    point[num - 1] = 1
    
    // 입력된 숫자가 max보다 클 때
    if num > max {
        for _ in 0..<(num - max) {
            result.append("+")
        }
        result.append("-")
        pre = num
        max = num
    }
    
    // 입력된 숫자가 max보다 작을 때
    else {
        // 현재 입력된 숫자와 그 전 입력된 숫자 사이에 아직 pop되지 않은 수가 있다면, "NO"
        if point[((num - 1) + 1)...(pre - 1)].contains(0) {
            answer = "NO"
            break
        }
        
        else {
            result.append("-")
            pre = num
        }
    }
    
    if i == n - 1 {
        answer = result.joined(separator: "\n")
    }
}

print(answer)
