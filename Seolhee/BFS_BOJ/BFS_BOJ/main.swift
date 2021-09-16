// BOJ #2178 미로 탐색

import Foundation

let size = readLine()!.split(separator: " ").map({Int(String($0))!})
var maze = [[Int]]()

for _ in 0..<size[0] {
    maze.append(Array(readLine()!).map({Int(String($0))!}))
}

var len = 0 // 가능한 길마다 길이 체크
var min = 0 // 최소 길이

// bfs 재귀함수
func solution(_ x: Int, _ y: Int) {
    // i와 j가 도화지 크기 안에 해당하지 않거나, 1이 아닐 경우에 함수 종료
    if x == size[0]-1 && y == size[1]-1 {
        if min < len { min = len }
        return
    }
    else if x < 0 || x >= size[0] || y < 0 || y >= size[1] || maze[x][y] != 1 {
        return
    }
    
    len += 1 // length 1 증가시켜주기
    maze[x][y] = 0
    
    // 재귀 호출 (현재 자리와 붙어있는 주변 모든 자리 확인)
    solution(x+1, y) // 세로로 다음 자리
    solution(x-1, y) // 세로로 전 자리
    solution(x, y+1) // 가로로 다음 자리
    solution(x, y-1) // 가로로 전 자리
}

solution(0, 0)
print(min)
