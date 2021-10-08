//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/08.
//

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var m = input[0] // 가로
var n = input[1] // 세로
var h = input[2] // 상자 수

// ([m,m,m] * n ) * h
var box = [[[Int]]](repeating: [[Int]](repeating: [Int](), count: n), count: h)

for k in 0..<h {
    for j in 0..<n {
        let row = readLine()!.split(separator: " ").map {Int(String($0))!}
        // append(contentsOf: ) -> 원소 여러개 추가
        box[k][j].append(contentsOf: row)
    }
}
print(box)

// 위, 아래, 상, 하, 좌, 우 체크
let dx = [-1, 1, 0, 0, 0 ,0], dy = [0, 0, -1, 1, 0, 0], dz = [0, 0, 0, 0, -1, 1]
var queue = [(Int, Int, Int)]()

var toCook = 0 // 안익힌 토마토 (0) -> 익힌 토마토 (1)
var underCook = 0 // 안익은 토마토 개수

func bfs() {
    var idx = 0
    
    while idx < queue.count {
        let (z, x, y) = queue[idx]
        idx += 1
        
        for i in 0..<6 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nz = z + dz[i]
            
            if 0 <= nx && 0 <= ny && 0 <= nz && nx < n && ny < m && nz < h {
                if box[nz][nx][ny] == 0 {
                    queue.append((nz, nx, ny))
                    // 토마토 익는 일 수 갱신
                    box[nz][nx][ny] = box[z][x][y] + 1
                    toCook += 1
                }
            }
        }
    }
}


// 1. bfs 전, 익은 토마토 -> queue

for z in 0..<h {
    for x in 0..<n {
        for y in 0..<m {
            if box[z][x][y] == 1 {
                queue.append((z, x, y))
            } else if box[z][x][y] == 0 {
                underCook += 1
            }
        }
    }
}

// 2. bfs 탐색
bfs()
print(box)

// 3. bfs 후, 다 익은 상태면 0, 다 익지 못하면 -1
underCook == 0 ? print(0) : (underCook == toCook ? print(box.flatMap({$0}).flatMap({$0}).max()!-1) : print(-1))


