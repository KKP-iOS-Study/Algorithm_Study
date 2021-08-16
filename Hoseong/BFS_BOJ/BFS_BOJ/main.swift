//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/08/13.
//

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input[0] // 가로
var m = input[1] // 세로

var graph = [[String]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{ String($0) })
}

// 해당 노드 방문 처리 체크
var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

var cnt = 0 // 그림의 갯수
var width = 0 // 가장 넓은 넓이


func sol(_ x: Int, _ y: Int) {
    
    let d: [(x: Int, y: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우 체크
    var q: [(x: Int, y: Int)] = [(x, y)]
    
    check[x][y] = true // 해당 노드 방문 처리
    
    var count = 1
    var idx = 0
    
    while idx < q.count {
        let current = q[idx]
        idx += 1
        print("q = \(q)")
        print("-----------------")

        for i in 0..<4 {
            let nx = current.x + d[i].x
            let ny = current.y + d[i].y
            
            print("nx = \(current.x) + \(d[i].x)")
            print("ny = \(current.y) + \(d[i].y)")
            
            if 0 <= nx && nx < n && 0 <= ny && ny < m {
                print("조건 통과")
                if graph[nx][ny] == "1" && check[nx][ny] == false {
                    q.append((nx, ny))
                    check[nx][ny] = true
                    print("nx = \(nx), ny = \(ny)")
                    print("check = \(check)")
                    count += 1
                }
            }
        }
    }
    width = max(width, count)
    print("width \(width) = max(width, count) \(max(width, count))")
    print("\n")
}

for i in 0..<n {
    for j in 0..<m {
        
        if graph[i][j] == "1" && check[i][j] == false {
            sol(i, j)
            cnt += 1
        }
    }
}

print(cnt)
print(width)

