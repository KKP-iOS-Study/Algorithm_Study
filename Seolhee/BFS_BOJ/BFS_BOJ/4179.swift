// BOJ #4179 불!

import Foundation

let size = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = size[0] // 가로 칸 수
let m = size[1] // 세로 칸 수
var maze = [[String]]() // 주어진 미로
var queue_J = [(Int, Int)]() // 지훈이 큐
var queue_F = [(Int, Int)]() // 불 큐
let dx = [-1, 1, 0 , 0], dy = [0, 0, -1, 1] // 상하좌우 검색을 위한 좌표 변화량
var result = 0 // 탈출 시간

func Fire(_ next: inout [(Int, Int)]) {
    // 기존 불 큐에 들어있는 자리들을 모두 검사!
    for i in 0..<queue_F.count {
        let (x, y) = queue_F[i]
        
        for j in 0..<4 {
            let nx = x + dx[j]
            let ny = y + dy[j]
            
            // 미로 범위 안에서 "."을 만난 경우 불이 전파되었음을 "F"로 표시
            if 0 <= nx && 0 <= ny && nx < n && ny < m {
                if maze[nx][ny] == "." {
                    maze[nx][ny] = "F"
                    next.append((nx, ny)) // 파라미터로 받은 빈 배열 next에 전파된 좌표를 하나씩 추가
                }
            }
        }
    }
}

func Jihoon(_ next: inout [(Int, Int)]) -> Bool {
    // 기존 지훈이 큐에 들어있는 자리들을 모두 검사!
    for i in 0..<queue_J.count {
        let (x, y) = queue_J[i]
        
        for j in 0..<4 {
            let nx = x + dx[j]
            let ny = y + dy[j]
            
            // 미로 범위 안에서 "."을 만난 경우 "J"로 표시
            if 0 <= nx && 0 <= ny && nx < n && ny < m {
                if maze[nx][ny] == "." {
                    maze[nx][ny] = "J"
                    next.append((nx,ny)) // 파라미터로 받은 빈 배열 next에 이동한 좌표를 하나씩 추가
                }
            }
            // 검색하는 범위가 미로 밖이라면 지훈이는 탈출에 성공한것,!! 따라서 true 리턴
            else { return true }
        }
    }
    return false
}


// ===== ===== ===== 메인 실행 ===== ===== =====

for _ in 0..<n {
    maze.append(Array(readLine()!).map({String($0)}))
}

for x in 0..<n {
    for y in 0..<m {
        if maze[x][y] == "J" { queue_J.append((x, y)) } // 처음 지훈이의 위치 저장
        else if maze[x][y] == "F" { queue_F.append((x, y)) } // 처음 불의 위치 저장
    }
}

while true {
    // (반복마다 새로운 빈 배열이 필요하므로 여기서 선언)
    var next_J = [(Int, Int)]() // 다음에 탐색할 지훈이의 위치들
    var next_F = [(Int, Int)]() // 다음에 탐색할 불의 위치들
    
    // 더이상 탐색할 지훈이가 없을 때 (전부 이미 불과 만났거나 벽에 부딪혔음)
    if queue_J.isEmpty { print("IMPOSSIBLE"); break }
    
    result += 1 // 지훈이랑 불이 한 번 주변으로 퍼져나갈 때마다 누적되는 값 => 탈출 시간 측정
    
    Fire(&next_F) // 불 퍼져나가는 실행
    
    // 지훈이가 탈출하는 실행으로, 탈출에 성공했을 시(true) result를 출력하고 끝!
    if Jihoon(&next_J) == true { print(result); break }
    
    // 지훈이 이동 큐와 불 이동 큐에 새로 업데이트된 큐 넣어주기
    queue_J = next_J
    queue_F = next_F
}
