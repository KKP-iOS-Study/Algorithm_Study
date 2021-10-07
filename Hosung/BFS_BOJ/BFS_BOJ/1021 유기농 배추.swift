//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/05.
//

// 해당 문제는 그래프의 모든 정점을 방문하는 것이므로, BFS 와 DFS 두 가지 방법 다 사용하여 풀어도 된다.

let T = Int(readLine()!)!

for _ in 0..<T {

    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = input[0], n = input[1], k = input[2]
    let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1] // 상, 하, 좌, 우 체크

    var map = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n) // 해당 노드 방문 처리 체크

    func dfs(_ x: Int, _ y: Int) {

        if map[x][y] == true {
            map[x][y] = false

            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if 0 <= nx && nx < n && 0 <= ny && ny < m {
                    dfs(nx, ny)
                }
            }
        }
    }
    
//    func bfs(_ x: Int, _ y: Int) {
//
//        var queue = [(x, y)]
//
//        while !queue.isEmpty {
//
//            let (x, y) = queue.removeFirst()
//
//            for i in 0..<4 {
//                let nx = x + dx[i]
//                let ny = y + dy[i]
//
//                if 0 <= nx && nx < n && 0 <= ny && ny < m {
//                    if map[nx][ny] == true {
//                        queue.append((nx, ny))
//                        map[nx][ny] = false
//                    }
//                }
//            }
//        }
//
//    }

    for _ in 0..<k {
        let location = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[location[1]][location[0]] = true // 배추의 위치는 true
    }

    var cnt = 0

    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == true {
                dfs(i, j)
                //bfs(i, j)
                cnt += 1
            }
        }
    }

    print(cnt)
}

