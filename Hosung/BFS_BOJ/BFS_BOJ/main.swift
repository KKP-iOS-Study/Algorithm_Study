//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/11/09.
//

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input[0], m = input[1]

// 최단거리 - BFS
// 벽을 부술지 안부술지 고려 -> 상하좌우를 체크할 때, 해당 벽이 부숴졌는지도 체크?

var arr = [[Int]]()
for _ in 0..<n { arr.append(readLine()!.map{ Int(String($0))! }) }

let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1]
var map = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

func bfs(_ x: Int, _ y: Int) {
    var queue = [(x, y)]
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx && nx < m && 0 <= ny && ny < n {
                if map[nx][ny] == true {
                    queue.append((nx, ny))
                    map[nx][ny] = false
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 1 && map[i][j] == false {
            bfs(i, j)
        }
    }
}
