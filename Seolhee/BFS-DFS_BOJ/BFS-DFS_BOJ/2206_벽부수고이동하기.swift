// BOJ #2206 벽 부수고 이동하기
//
// visited는 자리마다 방문한 적 있는지 판별하는 배열인데, 3차원으로 확장하여서
// '부수고 방문한 적 있는지, 부수지 않고 방문한 적 있는지'까지 체크해줄 수 있게 했음
// [x][y][0]은 부수고 방문, [x][y][1]은 부수지 않고 방문

let nm = readLine()!.split(separator: " ").map({Int(String($0))!})
let n = nm[0]
let m = nm[1]
var map = [[Int]]()
var result = 0
var queue = [(Int, Int, Int)]() // (x, y, z) == (x 좌표, y 좌표, 부쉈는지(0)/안부쉈는지(1))
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var visited = Array(repeating: Array(repeating: [0, 0], count: m), count: n) // 방문 여부 체크

for _ in 0..<n { map.append(Array(readLine()!).map{Int(String($0))!}) }

func bfs() -> Int {
    queue.append((0, 0, 1)) // queue에 탐색을 시작할 자리를 추가했음 (시작점은 0이므로 벽을 부수지 않는 것으로 표시)
    visited[0][0][1] = 1 // map에서 (0, 0) 자리를 방문했고, 벽을 부수지 않았음을 표시
    var index = 0
    
    while queue.count > index {
        let (x, y, z) = queue[index]
        index += 1
        
        if (x, y) == (n-1, m-1) { return visited[x][y][z] }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            
            // 방문한 적 없는 경우
            if visited[nx][ny][z] == 0 {
                // 벽이고, 벽을 부수지 않았던 경우 => 부술 수 있는 경우
                if map[nx][ny] == 1 && z == 1 {
                    visited[nx][ny][0] = visited[x][y][1] + 1 // 벽을 부쉈다는 것 표시, 여기까지 온 거리를 기록
                    queue.append((nx, ny, 0)) // 새롭게 탐색할 좌표와, 벽을 부순 적 있다는 정보를 함께 저장
                }
                // 벽이 아닐 경우
                else if map[nx][ny] == 0 {
                    visited[nx][ny][z] = visited[x][y][z] + 1 // 여기까지 온 거리를 기록, 이전에 벽을 부쉈는지에 대한 이력 그대로 전달
                    queue.append((nx, ny, z)) // 새롭게 탐색할 좌표와, 이전에 벽을 부쉈는지에 대한 이력을 그대로 저장
                }
            }
        }
    }
    
    return -1
}

print(bfs())


