// BOJ #7569 토마토
/*
 이 문제는 저번에 풀었던 #7576 토마토문제와 거의 유사하고,
 탐색하는 방향을 상하좌우에 위아래까지 추가해주면 끝일듯,!
 */

let info = readLine()!.split(separator: " ").map({Int(String($0))!})
let m = info[0] // 상자 가로 칸의 수
let n = info[1] // 상자 세로 칸의 수
let h = info[2] // 쌓아올리는 상자의 수
var box = Array(repeating: [[Int]](), count: h)
var queue = [(Int, Int, Int)]()
let dz = [-1, 1, 0, 0, 0, 0], dx = [0, 0, -1, 1, 0 , 0], dy = [0, 0, 0, 0, -1, 1] // 위아래, 상하좌우 검색을 위한 좌표 변화량
var empty = 0
var count = 0

for i in 0..<h {
    for _ in 0..<n {
        box[i].append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
}

func bfs() {
    var index = 0
    
    while index < queue.count {
        let (z, x, y) = queue[index]
        index += 1
        
        for j in 0..<6 {
            let nz = z + dz[j]
            let nx = x + dx[j]
            let ny = y + dy[j]
            
            if nz < 0 || nx < 0 || ny < 0 || nz >= h || nx >= n || ny >= m { continue } // 예외
            
            // 탐색한 자리가 0일 경우! (이제 익혀질 것임)
            if box[nz][nx][ny] == 0 {
                queue.append((nz, nx, ny)) // 1로 익혀졌으므로, 새로운 탐색 시작점이 추가되어야 함
                box[nz][nx][ny] = box[z][x][y] + 1 // 이 자리까지 익혀지는데에 걸린 시간을 누적
                count += 1 // 익힌 카운트 누적
            }
        }
    }
}

for z in 0..<h {
    for x in 0..<n {
        for y in 0..<m {
            if box[z][x][y] == 1 { queue.append((z, x, y)) } // 익은 토마토 위치를 탐색 시작점으로 추가
            else if box[z][x][y] == 0 { empty += 1 } // 안익은 토마토의 개수 세기
        }
    }
}

bfs()

// empty가 0이면 처음부터 안익은 토마토가 없었다는 뜻이므로 바로 0 출력,
// empty가 count와 같아졌다면 익혀지는데 걸린 누적 시간들 중 가장 큰 수 출력,
// empty가 count와 같아지지 못했다면 아직 안익은 토마토가 있다는 뜻이므로 -1 출력
empty == 0 ? print(0) : (empty == count ? print(box.flatMap({$0}).flatMap({$0}).max()!-1) : print(-1))
