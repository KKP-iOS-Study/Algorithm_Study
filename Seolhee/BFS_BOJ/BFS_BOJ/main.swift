// BOJ #7576 토마토

import Foundation

let size = readLine()!.split(separator: " ").map({Int(String($0))!}) // 상자 크기
let m = size[0] // 가로 칸 수
let n = size[1] // 세로 칸 수
var box = [[Int]]()
var queue = [(Int, Int)]()
let dx = [-1, 1, 0 , 0], dy = [0, 0, -1, 1] // 상하좌우 검색을 위한 좌표 변화량
var empty = 0
var count = 0

for _ in 0..<n {
    box.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
}

func bfs() {
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            
            if box[nx][ny] == 0 {
                queue.append((nx, ny))
                box[nx][ny] = box[x][y] + 1
                count += 1
            }
        }
    }
}

// 메인 코드 실행 전, 박스에 있는 익은 토마토 및 안익은 토마토 체크
for x in 0..<n {
    for y in 0..<m {
        if box[x][y] == 1 { queue.append((x, y)) }
        else if box[x][y] == 0 { empty += 1 }
    }
}

bfs()

empty == 0 ? print(0) : (empty == count ? print(box.flatMap({$0}).max()!-1) : print(-1))
