//
//  main.swift
//  BFS_BOJ
//
//  Created by 강호성 on 2021/10/09.
//

// DFS - 직사각형 넓이 즉, 각 영역별로 요소의 개수를 구해야 한다.
// 직사각형 좌표를 준 것에서 직사각형 영역을 1로 배열에 입력
// 배열을 돌면서, 값이 0이라면 DFS로 탐색, 배열값이 0일 때마다 영역의 넓이를 구하는 cnt 를 +1
// 1씩 증가한 카운트를 arr에 값을 넣어준다.
// 배열을 완전탐색하면 arr에 영역의 넓이가 들어가고, 그 개수와 arr의 원소를 오름차순

let input = readLine()!.split(separator: " ").map {Int(String($0))!}

let m = input[0], n = input[1], k = input[2] // 행, 열, 직사각형 갯수

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1] // 상, 하, 좌, 우 체크

var cnt = 0 // 영역의 넓이 카운트

var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

// 직사각형 좌표를 준 것에서 직사각형 영역을 1로 배열에 입력
for _ in 0..<k {
    let rectangle = readLine()!.split(separator: " ").map {Int(String($0))!}
    let x1 = rectangle[0], y1 = rectangle[1], x2 = rectangle[2], y2 = rectangle[3]
    
    for x in x1..<x2 {
        for y in y1..<y2 {
            map[y][x] = 1
        }
    }
}

func dfs(_ x: Int, _ y: Int) {

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx && nx < n && 0 <= ny && ny < m {
            if map[ny][nx] == 0 {
                map[ny][nx] = 1
                dfs(nx, ny)
                cnt += 1
            }
        }
    }
}


var arr = [Int]() // 영역을 담을 배열

for i in 0..<m {
    for j in 0..<n {
        if map[i][j] == 0 {
            map[i][j] = 1 // 1. 방문 체크
            cnt += 1 // 2. 영역의 넓이 구하는 cnt +1
            dfs(j, i) // 3. 상하좌우 탐색해서 ~ +1
            arr.append(cnt) // 4. 배열에 넓이 값 담기
            cnt = 0 // 5. 초기화
        }
    }
}
print(arr.count)
print(arr.sorted().map {String($0)}.joined(separator: " "))
