//
//  main.swift
//  Greedy
//
//  Created by 강호성 on 2021/08/26.
//


let N = Int(readLine()!)!
var tmp = [[Int]]()
var pq = [[Int]]()

for _ in 0..<N {
    let time = readLine()!.split(separator: " ").map{Int(String($0))!}
    tmp.append(time)
}

// 시작시간 기준 오름차순
tmp.sort {
    if $0[0] == $1[0] {
        return $0[1] < $1[1]
    } else { return $0[0] < $1[0] }
}

var cnt = 1
pq.append(tmp[0])

for i in 1..<N {
    
    if pq[0][1] > tmp[i][0] {
        cnt += 1
        pq.append(tmp[i])
    } else {
        pq.removeFirst()
        pq.append(tmp[i])
    }
    
    // 우선순위 큐는 종료시간 기준 오름차순
    pq.sort {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
}

print(cnt)
