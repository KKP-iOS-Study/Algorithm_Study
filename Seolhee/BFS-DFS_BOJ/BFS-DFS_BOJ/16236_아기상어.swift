// BOJ #16236 아기상어
//
// bfs 함수를 돌릴 때마다 현재 아기 상어의 위치에서 첫 번째로 먹을 수 있는 물고기들을 모두 구하여 fish 배열에 저장 후,
// fish 배열을 정렬하여, 저장된 물고기들 중 문제에서 주어진 조건에 가장 알맞는 물고기를 찾아 선택한다.
// 한 번의 bfs 함수 실행 시 마다 어떤 물고기를 먹는 것이 가장 효율적인지 따지고, 더 이상 먹을 물고기가 없을 경우 실행 종료한다.

let n = Int(readLine()!)!
var space = [[Int]]() // 주어진 공간에 대한 정보
var fish = [(Int, Int, Int)]() // 먹힌 물고기의 (x 좌표, y 좌표, 아기 상어와의 거리)들을 저장할 배열
var shark = (0, 0) // 상어 위치
var distance = [[Int]]() // 주어진 공간의 칸마다 아기 상어가 해당 위치로 오는데 걸린 거리를 저장
var count = 0 // 아기 상어의 크기 증가를 계산하기 위한 카운트 변수
var size = 2 // 아기 상어 크기
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var queue = [(Int, Int)]()
var result = 0

for _ in 0..<n { space.append(readLine()!.split(separator: " ").map({Int(String($0))!})) }

func bfs() {
    var index = 0 // index 변수를 이용해서 removeFirst 피해줌
    queue.append(shark) // 큐에 현재 상어 위치 추가
    distance[shark.0][shark.1] = 1 // 해당 위치를 중복해서 탐색하지 않도록, 시작 위치이지만 거리를 1로 설정해주어 차별화해주었음
    
    // 더 이상 탐색해야 할 좌표가 없을 때까지 반복
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1 // queue에 저장되어있는 한 좌표의 탐색을 시작하였으므로, index 한 칸 옮겨주기
        
        // 상하좌우 탐색을 위해 4번 반복
        for i in 0..<4 {
            // 탐색할 좌표 설정
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || ny < 0 || nx >= n || ny >= n || distance[nx][ny] != 0 { continue } // 예외
            
            // 탐색할 자리에 물고기가 있고, 아기 상어보다 사이즈가 작을 때 (물고기 먹기에 성공한 경우)
            if space[nx][ny] != 0 && space[nx][ny] < size {
                distance[nx][ny] = distance[x][y] + 1 // [x][y] 자리에서 한 칸 더 왔음을 표시
                fish.append((nx, ny, distance[nx][ny])) // 먹힌 물고기의 좌표와 거기까지 걸린 거리에 대한 정보를 추가
                continue
            }
            
            // 탐색할 자리에 물고기가 없거나, 아기상어와 사이즈가 같을 때 (아직 먹을 물고기를 찾지 못한 경우)
            if space[nx][ny] == 0 || space[nx][ny] == size {
                distance[nx][ny] = distance[x][y] + 1 // [x][y] 자리에서 한 칸 더 왔음을 표시
                queue.append((nx, ny)) // 탐색해야 할 좌표를 추가
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if space[i][j] == 9 { shark = (i, j); space[i][j] = 0 } // 아기 상어의 초기 위치 찾고, 해당 자리는 0으로 채워주기
    }
}

while true {
    // bfs 함수 돌리기 전 초기화
    fish = [(Int, Int, Int)]()
    distance = Array(repeating: Array(repeating: 0, count: n), count: n)
    queue = [(Int, Int)]()
    
    bfs()
    
    if fish.isEmpty { print(result); break } // 이번 bfs 함수 실행에서는 먹힌 물고기가 없다는 뜻으로, result 값을 그대로 출력, 실행 종료 !
    
    count += 1
    
    // 아기 상어와의 거리가 짧았던 것부터 오름차순, x좌표가 작은 것부터 오름차순, y좌표가 작은 것부터 오름차순으로 정렬
    // (아기 상어는 가장 가까운 물고기부터 먹고, 거리가 가까운 물고기가 많다면 가장 위에 있는 물고기, 그러한 물고기가 여러마리라면 가장 왼쪽에 있는 물고기를 먹는다는 조건에 의함)
    fish = fish.sorted {
        if $0.2 <= $1.2 {
            if $0.0 == $1.0 { return $0.1 < $1.1 }
            else { return $0.0 < $1.0 }
        }
        else { return false }
    }
    
    space[fish[0].0][fish[0].1] = 0 // 위에서 조건에 맞게 먹힌 물고기들을 정렬하였을 때, 가장 먼저 먹히는게 맞는 물고기의 자리를 0으로 바꿔줌
    result += distance[fish[0].0][fish[0].1] - 1 // 해당 물고기와 아기 상어와의 거리에서 1을 뺀 값을 result에 더해줌
    
    // 아기 상어의 크기가 count와 같아졌을 경우 상어 크기 증가 (아기 상어는 자신의 크기와 같은 수의 물고기를 먹을 때마다 크기가 1 증가한다는 조건에 의함)
    if size == count { size += 1; count = 0 }
    
    shark = (fish[0].0, fish[0].1) // 먹은 물고기의 자리로 상어 위치 바꿔줌
}
