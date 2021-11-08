//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/11/08.
//

// N 이 K 를 찾는 가장 빠른시간 출력
// N 위치에서 1초 후 갈 수 있는 모든 좌표를 큐에 넣고 BFS 로 탐색

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var N = input[0], K = input[1]

// N 이 이미 방문한 곳 체크
var visit = Array(repeating: false, count: 100001)

var queue = [(N, 0)] // (수빈 위치, 시간)

// 위치가 유효한지 체크
func check(_ n: Int) -> Bool { n<0 || n>100000 ? false : true }

var idx = 0
var result = 0 // 출력 시간


while queue.count > idx {
    let pop = queue[idx]
    
    let x = pop.0, time = pop.1
    
    // 동생 (K) 위치와 같으면 break
    if x == K {
        result = time
        break
    }
    
    // -1, +1, *2
    if check(x-1) && !visit[x-1] {
        visit[x-1] = true // 해당 위치 방문 체크
        queue.append((x-1, time+1)) // 큐에 (+1초, 해당 위치)
    }
    
    if check(x+1) && !visit[x+1] {
        visit[x+1] = true
        queue.append((x+1, time+1))
    }
    
    if check(x*2) && !visit[x*2] {
        visit[x*2] = true
        queue.append((x*2, time+1))
    }
    
    idx += 1
}

print(result)





