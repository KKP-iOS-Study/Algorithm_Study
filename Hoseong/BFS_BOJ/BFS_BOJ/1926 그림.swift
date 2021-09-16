//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/08/13.
//

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input[0] // 세로
var m = input[1] // 가로

var graph = [[String]]()

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{ String($0) })
}

var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n) // 해당 노드 방문 처리 체크
var cnt = 0 // 그림의 갯수
var width = 0 // 가장 넓은 넓이

func BFS(_ x: Int, _ y: Int) {
    
    let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1] // 상, 하, 좌, 우 체크
    var queue = [(x, y)]
    
    check[x][y] = true // 해당 노드 방문 처리
    var count = 1

    while !queue.isEmpty {
        // 큐에서 노드를 꺼낸 뒤에
        let current = queue.removeFirst()
        
        // 인접 노드 (상,하,좌,우) 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리
        for i in 0..<4 {
            let nx = current.0 + dx[i]
            let ny = current.1 + dy[i]
            
            // 공간을 벗어나지 않은 경우
            if 0 <= nx && nx < n && 0 <= ny && ny < m {
                if graph[nx][ny] == "1" && check[nx][ny] == false {
                    // 큐에 삽입하고, 방문처리
                    queue.append((nx, ny))
                    check[nx][ny] = true
                    count += 1
                }
            }
        }
    }
    // 상,하,좌,우 의 count 를 통해 넓이 계산
    width = max(width, count)
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == "1" && check[i][j] == false {
            BFS(i, j)
            cnt += 1
        }
    }
}

print(cnt)
print(width)

