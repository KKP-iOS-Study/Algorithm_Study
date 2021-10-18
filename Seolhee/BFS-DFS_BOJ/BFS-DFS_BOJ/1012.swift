// BOJ #1012 유기농 배추
/*
 #1926 그림이랑 아쥬 비슷
 2중 for문으로 반복하면서 모든 자리 탐색하는데,
 탐색하면서 1이 나오면 그 떄 dfs 함수 돌려줌 이 때 카운트 +1
 dfs 함수는 상하좌우 모두 체크하는데 체크하다가 범위 벗어나거나 0만날 시 끝이고
 1만날시에는 그냥 계속가 근데 이미 체크끝난 자리는 0으로 바꿔줌
 이거 땅 끝까지 반복!
 */

let testCase = Int(readLine()!)!

func dfs(_ x: Int, _ y: Int, _ land: inout [[Int]], _ m: Int, _ n: Int) {
    // 땅 크기 안에 해당하지 않거나, 1이 아닐 경우에 함수 종료
    if x < 0 || x >= n || y < 0 || y >= m || land[x][y] != 1 { return }
    
    land[x][y] = 0 // 이미 체크한 자리는 0으로 바꿔주기
    
    // 재귀 호출 (현재 자리와 붙어있는 주변 모든 자리 확인)
    dfs(x+1, y, &land, m, n) // 세로로 다음 자리
    dfs(x-1, y, &land, m, n) // 세로로 전 자리
    dfs(x, y+1, &land, m, n) // 가로로 다음 자리
    dfs(x, y-1, &land, m, n) // 가로로 전 자리
}

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = input[0] // 배추밭 가로 길이
    let n = input[1] // 배추밭 세로 길이
    let num = input[2] // 배추 개수
    var land = Array(repeating: Array(repeating: 0, count:  m), count: n)
    var count = 0
    
    // 배추 있는 자리는 다 1로 채워주기
    for _ in 0..<num {
        let location = readLine()!.split(separator: " ").map({Int(String($0))!})
        land[location[1]][location[0]] = 1
    }
    
    // 땅 전부 검사하면서 1있으면 dfs 돌리기
    for i in 0..<n {
        for j in 0..<m {
            if land[i][j] == 1 {
                count += 1
                dfs(i, j, &land, m, n)
            }
        }
    }
    
    print(count)
}
