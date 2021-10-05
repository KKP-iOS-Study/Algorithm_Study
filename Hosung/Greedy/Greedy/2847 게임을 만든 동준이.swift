//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/19.
//

let N = Int(readLine()!)!

var level = [Int]()
var cnt = 0

for _ in 0..<N {
    let score = Int(readLine()!)!
    level.append(score)
}

// 가장 높은 레벨을 기준으로, 아래 레벨이 현재 레벨보다 높을 경우, 현재 레벨보다 1만큼만 낮게 해주면 된다.
level.reverse()

for i in 0..<N-1 { // 마지막 값은 i+1이 범위에 없기때문에 빼준다.

    if level[i] <= level[i+1] {
        
        while level[i] <= level[i+1] {
            level[i+1] -= 1
            cnt += 1
        }
    }
}
print(cnt)
