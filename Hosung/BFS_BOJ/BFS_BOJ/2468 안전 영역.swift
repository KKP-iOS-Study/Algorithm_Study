//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/12.
//

// 높이 1~100 중에서, 안전영역의 수가 가장 많은 높이의 안전영역 갯수

let N = Int(readLine()!)!
var dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

var map = [[Int]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var cnt = 0 // 영역 체크
var ans = 1 // 아무 지역도 물에 잠기지 않을 수도 있다 -> 전체가 안전영역 고려

func dfs(_ x: Int, _ y: Int, _ height: Int) {

    check[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx && 0 <= ny && nx < N  && ny < N {
            if map[nx][ny] > height && !check[nx][ny] {
                dfs(nx, ny, height)
            }
        }
    }
}

for h in 1...map.flatMap({$0}).max()! { // 높이는 1 ~ 가장 높은 건물
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] > h && !check[i][j] {
                cnt += 1 // 한 영역 +1
                dfs(i, j, h) // 인접한 곳 모두 체크
            }
        }
    }
    
    ans = max(ans, cnt) // 영역의 수 중 가장 큰 수
    
    // 초기화
    cnt = 0
    for i in 0..<N {
        for j in 0..<N {
            check[i][j] = false
        }
    }
}

print(ans)
