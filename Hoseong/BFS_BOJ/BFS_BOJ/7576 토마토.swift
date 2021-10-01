//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/09/20.


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var m = input[0] // 가로
var n = input[1] // 세로

var box = [[Int]]()

for _ in 0..<n {
    box.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1] // 상, 하, 좌, 우 체크
var queue = [(Int, Int)]()

var idx = 0
var cnt = 0
var count = 0

func BFS() {

    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            // 공간을 벗어나지 않은 경우
            if 0 <= nx && nx < n && 0 <= ny && ny < m {
                if box[nx][ny] == 0 {
                    queue.append((nx, ny))
                    box[nx][ny] = box[x][y] + 1
                    cnt += 1
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        // 익은 토마토를 queue에 넣는다. box[세로][가로]
        if box[i][j] == 1 {
            queue.append((i, j))
        } else if box[i][j] == 0 {
            count += 1
        }
    }
}

BFS()

// 다 익은 상태면 0, 다 익지 못하면 -1
count == 0 ? print(0) : (count == cnt ? print(box.flatMap({$0}).max()!-1) : print(-1))
