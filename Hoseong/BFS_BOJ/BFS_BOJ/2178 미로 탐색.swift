//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/09/13.
//


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input[0] // 세로
var m = input[1] // 가로

var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.map{ Int(String($0))! })
}

let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1] // 상, 하, 좌, 우 체크
var queue = [(0, 0)]

while !queue.isEmpty {
    let current = queue.removeFirst()

    for i in 0..<4 {
        let nx = current.0 + dx[i]
        let ny = current.1 + dy[i]

        // 공간을 벗어나지 않은 경우
        if 0 <= nx && nx < n && 0 <= ny && ny < m {
            // 0 이면 패스
            if graph[nx][ny] == 0 { continue }

            else if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[current.0][current.1] + 1
                queue.append((nx, ny))
            }
        }
        
    }
}

print(graph[n-1][m-1])
