//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/11.
//

// 최소 이동 경로 - BFS
// dx,dy - 8 방향

let test = Int(readLine()!)!
let dx = [-1, -1, 1, 1, -2, -2, 2, 2], dy = [-2, 2, -2, 2, -1, 1, -1, 1]


for _ in 0..<test {
    
    let length = Int(readLine()!)!

    let start = readLine()!.split(separator: " ").map{Int(String($0))!}
    let sx = start[0], sy = start[1]
    
    let end = readLine()!.split(separator: " ").map{Int(String($0))!}
    let ex = end[0], ey = end[1]
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: length), count: length)
    
    var queue = [(sx, sy)] // 큐에 시작위치
    map[sx][sy] = 1 // 처음 위치 방문체크
    
    var idx = 0
    while queue.count > idx {
        
        let pop = queue[idx]
        let x = pop.0, y = pop.1
        
        if (x, y) == (ex, ey) {
            print(map[x][y] - 1)
            break
        }
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < length && ny < length {
                if map[nx][ny] == 0 {
                    map[nx][ny] = map[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }
        idx += 1
    }
}
