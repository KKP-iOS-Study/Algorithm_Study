// BOJ #2493 탑

import Foundation

let count = Int(readLine()!)!
let top = readLine()!.components(separatedBy: " ").map{Int($0)!} // 탑 높이 저장
var result = "0" // 결과 누적
var stack = [[0, top[0]]] // top의 인덱스, 높이 값을 담는 2차원 배열

for i in 1..<count {
    if top[i-1] < top[i] {
        if stack[stack.count-1][1] < top[i] {
            while stack[stack.count-1][1] < top[i] {
                stack.removeLast()
                if stack.isEmpty { break }
            }
        }
        if stack.isEmpty {
            result.append(" 0")
        }
        else {
            result.append(" " + String(stack[stack.count-1][0] + 1))
        }
        stack.append([i, top[i]])
    }
    else {
        result.append(" " + String(stack[stack.count-1][0] + 1))
        stack.append([i, top[i]])
    }
}

print(result)

