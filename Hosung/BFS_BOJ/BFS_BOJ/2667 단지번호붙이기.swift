//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/10.
//

let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.map{Int(String($0))!})
}

var dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
var cnt = 0

func dfs(_ x: Int, _ y: Int) {

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx && 0 <= ny && nx < N  && ny < N {
            if map[nx][ny] == 1 {
                map[nx][ny] = 0
                cnt += 1
                dfs(nx, ny)
            }
        }
    }
}

var arr = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            map[i][j] = 0
            cnt += 1
            dfs(i, j)
            arr.append(cnt)
            cnt = 0
        }
    }
}

print(arr.count)
print(arr.sorted().map {String($0)}.joined(separator: " "))
