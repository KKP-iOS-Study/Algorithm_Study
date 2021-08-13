// BOJ #2493 탑

import Foundation

let count = Int(readLine()!)!
let top = readLine()!.components(separatedBy: " ").map({Int($0)!})
var result = Array(repeating: 0, count: count)

// 스위프트 함수 적극 활용 -> 시간 초과
for i in 1..<count {
    let tmp = top[0...i-1].filter{$0 > top[i]}
    if tmp.count > 0 {
        result[i] = top.firstIndex(of: tmp[tmp.count - 1])! + 1
    }
    
// 2중 for문 활용 -> 시간 초과
//    for j in (0...i-1).reversed() {
//        if top[j] > top[i] {
//            result[i] = String(j + 1)
//            break
//        }
//    }
}

// 2중 for문 활용, 반복 횟수 줄임 -> 시간 초과
//var n = 0
//
//for i in n..<count-1 {
//    for j in i+1..<count {
//        if top[j] < top[i] {
//            result[j] = i+1
//        }
//        else {
//            n = j
//        }
//    }
//}

print(result.map{String($0)}.joined(separator: " "))
