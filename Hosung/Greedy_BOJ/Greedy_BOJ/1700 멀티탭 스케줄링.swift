//
//  main.swift
//  Greedy_BOJ
//
//  Created by 강호성 on 2021/11/08.
//

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let order = readLine()!.split(separator: " ").map{Int(String($0))!}

var plugged = [Int]()
var cnt = 0

for i in 0..<NK[1] {
    
    if plugged.contains(order[i]) { // 이미 꼽혀 있는 경우 -> continue
        continue
    } else if plugged.count < NK[0] { // 멀티탭에 자리가 있는 경우 -> 추가
        plugged.append(order[i])
    } else { // 멀티탭에 자리가 없는 경우 -> 조건별로 최적의 자리 제거
       
        var last = -1 // 가장 나중에 사용
        var idx = -1 // 뺄 자리
        
        for j in 0..<NK[0] { // 플러그 갯수만큼 돌 때,
            var tmp = 0
            
            for k in i+1..<NK[1] {
                if order[k] == plugged[j] { break } // 나중에 사용될 것
                tmp += 1
            }
            
            if tmp > last {
                last = tmp
                idx = j
            }
        }
        
        plugged[idx] = order[i] // 뺀자리에 추가
        cnt += 1
    }
}

print(cnt)

