//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/23.
//

let T = Int(readLine()!)! // 테스트케이스 수
var res = [Int](repeating: 0, count: T)

for t in 0..<T {
    let _ = Int(readLine()!)! // 일 수
    let value = readLine()!.split(separator: " ").map{ Int(String($0))! } // 주가
    
    var max = value.last!
    
    for i in (0..<value.count-1).reversed() {
        if value[i] > max {
            max = value[i]
        } else {
            res[t] += max - value[i]
        }
    }
}

for res in res { print(res) }
